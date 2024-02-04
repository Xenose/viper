#ifndef __header_viper_core_maths_fixed__
#define __header_viper_core_maths_fixed__

#include<viper/core/types/fixed.h>

extern ViperFixed64_t ViperFixedCreate(u8 flags, u64 real, u64 decimal);

extern ViperFixed64_t ViperFixedSubtract(ViperFixed64_t a, ViperFixed64_t b);
extern ViperFixed64_t ViperFixedAddition(ViperFixed64_t a, ViperFixed64_t b);
extern ViperFixed64_t ViperFixedDevide(ViperFixed64_t a, ViperFixed64_t b);
extern ViperFixed64_t ViperFixedMultiplay(ViperFixed64_t a, ViperFixed64_t b);

#endif /* __header_viper_core_maths_fixed__ */
