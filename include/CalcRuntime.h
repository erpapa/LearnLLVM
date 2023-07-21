#ifndef CALC_RUNTIME_H_
#define CALC_RUNTIME_H_

#ifdef __cplusplus
extern "C" {
#endif

void calc_write(int result);
int calc_read(const char* var);

#ifdef __cplusplus
}
#endif

#endif