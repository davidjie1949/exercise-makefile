#include <iostream>

class Student {
    public:
    Student(int grade = 1) : m_grade(grade){
        std::cout << "Student constructor created!" << std::endl;
    }

    ~Student(){
        std::cout << "Student destructor deleted!" << std::endl;
    }

    void set_grade(int grade);
    int get_grade() const;

    private:
    int m_grade;
};