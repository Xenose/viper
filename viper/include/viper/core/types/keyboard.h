#ifndef __header_viper_core_types_keybord__
#define __header_viper_core_types_keybord__

#include<viper/core/types/struct.h>

enum {
   VIPER_EVENT_TYPE_HOLD,
   VIPER_EVENT_TYPE_SHORT_PRESS,
   VIPER_EVENT_TYPE_LONG_PRESS,
};

typedef struct __ViperKeyEvent_t{
   ViperStructType_t sType;

   void (*func)(struct __ViperKeyEvent_t* event);
} ViperKeyEventData_t;

#endif /* __header_viper_core_types_keyboard__ */
