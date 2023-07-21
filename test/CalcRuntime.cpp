#include "CalcRuntime.h"
#include <iostream>

void calc_write(int result)
{
    std::cout << "The result is: " << result << std::endl;
}

int calc_read(const char* var)
{
    std::cout << "Enter a value for " << var << ": ";

    int value;
    std::cin >> value;
    return value;
}
