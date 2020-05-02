#include <vector>
#include <iostream>

using namespace std;
int solNum = 1;
bool checkPossible(vector<vector<int>> sudoku, int i, int j){
    bool possible = false;
    int next_i = i+(j+1)/9;
    int next_j = (j+1)%9;
    if (i==9 && j==0){
        return true;
    }
    if (sudoku[i][j]==0){
        for (int num=1; num<=9; num++){
            bool numPossible = true;
            for (int k=0; k<9; k++){
                if (sudoku[i][k]==num || sudoku[k][j]==num){
                    numPossible = false;
                    break;
                }
            }
            int box_i = (i/3)*3;
            int box_j = (j/3)*3;
            for (int m=box_i; m<box_i+3; m++){
                if (!numPossible){
                    break;
                }
                for (int n=box_j; n<box_j+3; n++){
                    if (sudoku[m][n]==num){
                        numPossible = false;
                        break;
                    }
                }

            }
            if (!numPossible){
                continue;
            }
            sudoku[i][j]=num;
            if (i==8 && j==8){
                for (int m=0; m<9; m++){
                    for (int n=0; n<9; n++){
                        cout << sudoku[m][n] << " ";
                    }
                    cout << endl;
                }
                cout << endl;
                break;
            }
            if (checkPossible(sudoku, next_i, next_j)){
                possible = true;
            }
        }
        return possible;
    }
    else{
        if (i==8&&j==8){
            for (int m=0; m<9; m++){
                for (int n=0; n<9; n++){
                    cout << sudoku[m][n] << " ";
                }
                cout << endl;
            }
            cout << endl;
        }
        return checkPossible(sudoku, next_i, next_j);
    }
}

int main(){
    int T;
    cin >> T;
    vector<vector<int>> sudoku (9,vector<int>(9,0));
    for (int t=0; t<T; t++){
        cout << "Sudoku "<<t+1<<":"<<endl;
        solNum = 1;
        for (int i=0; i<9; i++){
            for (int j=0; j<9; j++){
                cin >> sudoku[i][j];
            }
        }
        cout << endl;
        checkPossible(sudoku, 0, 0);
    }
    
    return 0;
}