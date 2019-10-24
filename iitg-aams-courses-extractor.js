//AAMS Course List and Grades Extraction

for (var i = 0; i < list.length; i++) {
    if (list[i].childNodes.length == 8) {
        console.log(
            list[i].childNodes[0].innerHTML.split(";")[1],
            list[i].childNodes[2].innerHTML.split(";")[1],
            list[i].childNodes[5].innerHTML.split(";")[1]
        );
    }
}
