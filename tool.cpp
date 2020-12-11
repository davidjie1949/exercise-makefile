#include "tool.hpp"
#include <iostream>

int Student::get_grade() const {
    return m_grade;
}

void Student::set_grade(int grade) {
    m_grade = grade;
}