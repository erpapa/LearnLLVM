#ifndef FUNCTION_H_
#define FUNCTION_H_

#include "Base.h"

class Function: public Base {
public:
    Function();
    virtual ~Function();
    
    void codegen();
};

#endif
