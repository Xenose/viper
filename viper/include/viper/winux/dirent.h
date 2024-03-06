#ifndef __header_viper_winux_dirent__
#define __header_viper_winux_dirent__

#ifndef _WIN32
   #include<dirent.h>
#else
   #include<Windows.h>

	enum {
		DT_UNKNOWN,
		DT_REG,
		DT_DIR,
	};

   typedef struct dirent {
	   ino_t d_ino;
	   off_t d_off;
	   unsigned short d_reclen;
	   unsigned char d_type;
	   char d_name[NAME_MAX + 1];
   } Dirent_t;

   typedef struct {
	   Dirent_t ent;
	   uint64_t count;
	   WIN32_FIND_DATA findFileData;
	   HANDLE handleFind;
   } DIR;

   extern DIR* opendir(cc* path);
   extern struct dirent* readdir(DIR* dir);
   extern int closedir(DIR* dir);
#endif /* _WIN32 */

#endif /* __header_viper_winux_dirent__ */
