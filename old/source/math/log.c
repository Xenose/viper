#include<math.h>
#include<stdlib.h>
#include<viper/math/log.h>

double ViperLog(int64_t value, int32_t base) {
	if (0 == value) {
		return 0;
	} else {
		return logl(labs(value)) / logl(base);
	}
}

