#ifndef __header_application__
#define __header_application__

#include<viper/types.h>

extern int ViperApplicationCreate(ViperApplication_t* app, const ViperApplicationCreateInfo_t* info);
extern void ViperApplicationStart(ViperApplication_t* app);

#endif /* __header_application__ */
