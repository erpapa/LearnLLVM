#ifndef CONDITION_H_
#define CONDITION_H_

#include "Base.h"

class Condition: public Base {
public:
    Condition();
    virtual ~Condition();
    
    void codegen();
};

#endif
