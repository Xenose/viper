#ifndef __header_viper_core_math_basic__
#define __header_viper_core_math_basic__

#include<stdint.h>

/**
 * ViperIntItoa is a way to calculate logarithm's its not
 * intended to get a accurate result, but instead give
 * the "length" of the number, this is useful for integer
 * parsing.
 *
 * @param base :: The base of the number.
 * @param x :: Is the value that will be calculated.
 *
 * @return Returns the integer logarithm of the value
 * in the base provided.
 * 
 * @note The underlying function is written in Fortran.
 */
extern int64_t ViperIntLog(int64_t base, int64_t x);

/**
 * Not everything requires heavy floating point math
 * so instead we are using integer powers for equations.
 *
 * @param p :: The power that will be used.
 * @param x :: The value that will be multiplied.
 *
 * @return The function will return the integer value,\
 * of the power.
 *
 * @note The underlying function is written in Fortran.
 */
extern int64_t ViperIntPower(int64_t p, int64_t x);

#endif /* __header_viper_core_math_basic__ */
