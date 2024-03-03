#ifndef __header_viper_core_file_dirent__
#define __header_viper_core_file_dirent__

#include<viper/core/types/defines.h>
#include<viper/core/platform/limits.h>

#ifndef _WIN32
   #include<dirent.h>
#else
	enum {
		DT_UNKNOWN,
		DT_REG,
		DT_DIR,
	};

   typedef struct {
   } DIR;

   struct dirent {
	   unsigned short d_reclen;
	   unsigned char d_type;
	   char* d_name[NAME_MAX + 1];
   };

   extern DIR* opendir(cc* path);
   extern struct dirent* readdir(DIR* dir);
   extern int closedir(DIR* dir);

#endif /* _WIN32 */

#endif /* __header_viper_core_file_dirent__ */
