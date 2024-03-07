#include<viper/winux/dirent.h>

#ifdef _WIN32

#include<stdint.h>
#include<stdlib.h>

    /**
    * A windows implementation of opendir :: see [ man dirent.h ]
    */
   DIR* opendir(const char* path) {
       char buffer[MAX_PATH + 1] = { 0 };
       DIR* out = calloc(1, sizeof(DIR));

       if (NULL == out) {
           goto ERROR_EXIT;
       }

       strncpy(buffer, path, MAX_PATH);
       strncat(buffer, "\\*", MAX_PATH);

       out->handleFind = FindFirstFile_T(buffer, &out->findFileData);

       if (INVALID_HANDLE_VALUE == out->handleFind) {
           goto ERROR_EXIT_FREE;
       }

       out->count = 0;
       return out;
ERROR_EXIT_FREE:
       free(out);
ERROR_EXIT:
       return NULL;
   }

   struct dirent* readdir(DIR* dir) {
       if (0 != dir->count++) {
           int64_t re = FindNextFile(dir->handleFind, &dir->findFileData);

           if (0 == re) {
           }
       }

       dir->ent.d_ino = 0;

       if (FILE_ATTRIBUTE_DIRECTORY & dir->findFileData.dwFileAttributes) {
           dir->ent.d_type = DT_DIR;
       } else if (FILE_ATTRIBUTE_NORMAL & dir->findFileData.dwFileAttributes) {
           dir->ent.d_type = DT_REG;
       } else {
           dir->ent.d_type = DT_UNKNOWN;
       }
       
       strncpy(dir->ent.d_name, dir->findFileData.cFileName, MAX_PATH);
       return &dir->ent;
   }
   
   int closedir(DIR* dir) {
       FindClose(dir->handleFind);
       free(dir);
       return 0;
   }
#endif /* _WIN32 */
