#ifndef __header_viper_core_dummy_hello__
#define __header_viper_core_dummy_hello__

/**
 * A simple function in Fortran that prints hello world.
 * Reason for its existen was just to test the C ISO binding
 * layer and learn about Fortran in General.
 */
extern void ViperFortranHello();


/**
 * This maybe is a good idea as I don't want to use
 * special names for my application, but not there
 * might be a conflict in future projects so this
 * macro will allow me to turn off the prefix.
 */
#ifdef VIPER_USE_NAMESPACE

#define FortanHello ViperFortanHello

#endif /* VIPER_USE_NAMESPACE */

#endif /* __header_viper_core_dummy_hello__ */
