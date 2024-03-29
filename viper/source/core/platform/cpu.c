#include<string.h>

#include<viper/core/platform/cpu.h>

#include<viper/core/debug/logger.h>
#include<viper/core/file/file.h>
#include<viper/core/string/stringer.h>

#include<fcntl.h>
#include<stdio.h>

#ifndef _WIN32
	#include<unistd.h>
#endif /* _WIN32 */

i8 __ViperCpuGetVendor(ViperCpuSpec_t* restrict spec, cc* restrict buffer, u64 lenght) {
	if (VIPER_TRUE == ViperStringIsMatch("*AMD*", buffer)) {
		spec->vendor = VIPER_CPU_VENDOR_AMD;
		goto EXIT;
	}

	if (VIPER_TRUE == ViperStringIsMatch("*Intel*", buffer)) {
		spec->vendor = VIPER_CPU_VENDOR_INTEL;
		goto EXIT;
	}

ERROR_EXIT:
	return -1;
EXIT:
	return 0;

}

i8 __ViperCpuGetCoreCount(ViperCpuSpec_t* restrict spec, cc* restrict buffer, u64 lenght) {
   u64 cores = 0;

   if (0 != ViperAtou(&cores, buffer, lenght, 10)) {
      ViperLogError("Problems reading core count from cpu info");
      goto ERROR_EXIT;
   }

	return 0;
ERROR_EXIT:
   return -1;
}

/**
 * A general function that finds the value in the proc file and then
 * passes the location to the actual operation function.
 *
 * @param parm :: The string to search for example [ "vendor_id", "cpu cores", ... ].
 * @param spec :: The struct where the data will be stored.
 * @param file :: The file that will be parsed.
 * @param func :: The function that will handle the data loading into the struct.
 *
 * @return Returns 0 on success and -1 on error.
 */
i8 __ViperCpuGetSpec(cc* parm, ViperCpuSpec_t* restrict spec, const  ViperFile_t* restrict file,
		i8 (*func)(ViperCpuSpec_t* restrict spec, cc* restrict buffer, u64 lenght)) {
	u64 lenght = 0;
	char buffer[256] = { 0 };
	char* ptr = NULL;

	ptr = ViperStringFindDevider(strstr(file->buffer.str, parm), ':') + 1;

	if (NULL == ptr) {
		goto ERROR_EXIT;
	}

	char* tmp = ViperStringGetSub(ptr, &lenght);
	memcpy(buffer, tmp, lenght);

	// calling the function that will handle the actual parsing
	return func(spec, buffer, lenght);
ERROR_EXIT:
	return -1;
}

i8 ViperCpuGetSpecs(ViperCpuSpec_t* spec) {
	ViperFile_t proc;
	char* ptr = NULL;

	if (0 != ViperFileOpenLoad(&proc, "/proc/cpuinfo", O_RDONLY, 0)) {
		ViperLogWarning("Failed to load /proc/cpuinfo");
		goto ERROR_EXIT;
	}
   
   ViperLogDebug(proc.buffer.str);

	if (0 != __ViperCpuGetSpec("vendor_id", spec, &proc, &__ViperCpuGetVendor)) {
		ViperLogWarning("No vendor ID found");
	}

	if (0 != __ViperCpuGetSpec("cpu cores", spec, &proc, &__ViperCpuGetCoreCount)) {
		ViperLogWarning("No vendor ID found");
	}

	return 0;
ERROR_EXIT:
	return -1;
}
