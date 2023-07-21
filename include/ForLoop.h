#ifndef FOR_LOOP_H_
#define FOR_LOOP_H_

#include "Base.h"

class ForLoop: public Base {
public:
    ForLoop();
    virtual ~ForLoop();
    
    void codegen();
};

#endif
