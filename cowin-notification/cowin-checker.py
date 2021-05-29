import requests
import json
import time
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from socket import gaierror
from datetime import date, datetime, timedelta

url = "https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByDistrict"
headers = {
    'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0',
    'Accept':'application/json'
}

smtp_server = "SMTP Server Address"
smtp_port = "SMTP TLS Port"
smtp_login = "SMTP Username"
smtp_password = "SMTP Password"

sender_address = "Mail Sender Address"
receiver_address = "Mail Receiver Address"

#Get District IDs from districts.txt
district_ids = []

def addlog(log_file, log):
    log_file.write(log)
    log_file.write("\n")

new_centers_file = open('cowin.json', 'w')
new_centers_file.write(json.dumps({"new":{},"old":{}}))
new_centers_file.close()

while True:
    old_centers_file = open('cowin.json', 'r')
    old_centers_json = json.load(old_centers_file)
    old_centers = {**old_centers_json["new"], **old_centers_json["old"]}
    old_centers_file.close()
    results = {"new":{},"old":{}}

    tomorrow = (datetime.now()+timedelta(days=1)).strftime("%d-%m-%Y")
    params = {
        'district_id':0,
        'date': tomorrow
    }
    start_time = datetime.now()
    for district_id in district_ids:
        params['district_id']=district_id
        response = requests.get(url, headers=headers, params=params)
        response_json = response.json()
        for center in response_json['sessions']:
            if center['min_age_limit']==18 and center['available_capacity_dose1']>0:
                if str(center["center_id"]) in old_centers:
                    results["old"][str(center["center_id"])]=center
                else:
                    results["new"][str(center["center_id"])]=center
    results_json = json.dumps(results, indent=4)
    new_centers_file = open('cowin.json', 'w')
    new_centers_file.write(results_json)
    new_centers_file.close()

    log_file = open('cowin.log','a')
    addlog(log_file, str(start_time))
    addlog(log_file, "new: "+str(list(results["new"].keys())))
    addlog(log_file, "old: "+str(list(results["old"].keys())))

    if len(results["new"])>0:
        try:
            with smtplib.SMTP(smtp_server, smtp_port) as server:
                server.starttls()
                server.login(smtp_login, smtp_password)
                message = MIMEMultipart()
                message['From'] = sender_address
                message['To'] = receiver_address
                message['Subject'] = "COWIN Availability Alert for "+tomorrow+" | Checked at "+str(start_time)
                message.attach(MIMEText(results_json, 'plain'))
                server.sendmail(sender_address, receiver_address, message.as_string())
                addlog(log_file, 'Mail Sent')
        except (gaierror, ConnectionRefusedError):
            addlog(log_file, 'Failed to connect to the server. Bad connection settings?')
        except smtplib.SMTPServerDisconnected:
            addlog(log_file, 'Failed to connect to the server. Wrong user/password?')
        except smtplib.SMTPException as e:
            addlog(log_file, 'SMTP error occurred: ' + str(e))
    
    addlog(log_file, "\n")
    log_file.close()
    end_time = datetime.now()
    loop_time = end_time-start_time
    time.sleep(300-loop_time.total_seconds())