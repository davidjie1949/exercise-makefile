#include <iostream>
#include "tool.hpp"

using namespace std;

int main(){

    Student jie;
    jie.set_grade(12);
    cout << jie.get_grade() << endl;
    
    return 0;
}
