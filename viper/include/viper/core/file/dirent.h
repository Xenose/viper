#ifndef __header_viper_core_file_dirent__
#define __header_viper_core_file_dirent__

#ifndef _WIN32
   #include<dirent.h>
#else
   typedef struct {
   } DIR;

   extern DIR* opendir(cc* path);

#endif /* _WIN32 */

#endif /* __header_viper_core_file_dirent__ */
