#include <viper/core/maths/fixed.h>


ViperFixed64_t ViperFixedCreate(u8 negative, u64 real, u64 decimal) {
   ViperFixed64_t fixed = {
      .negative = negative,
      .real = real,
      .decimal = decimal,
   };

   return fixed;
}

ViperFixed64_t ViperFixedAddition(ViperFixed64_t a, ViperFixed64_t b) {

}
