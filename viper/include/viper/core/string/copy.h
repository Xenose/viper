#ifndef __header_viper_core_string_copy__
#define __header_viper_core_string_copy__

#include<viper/core/types/defines.h>

/**
 * This function is similar to the gnu stpncpy function, but instead
 * of returning a pointer this functions returns the number of charters
 * copied to the user.
 *
 * @param dst :: The destination buffer where the data will be copied to.
 * @param src :: The source null terminated buffer.
 * @param bytes :: The size of the output buffer.
 *
 * @return Returns a u64 length that is the number of bytes copied.
 */
extern u64 (*ViperStpnCpy)(char* dst, cc* src, u64 bytes);

#endif /* __header_viper_core_string_copy__ */
