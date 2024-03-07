#ifndef __header_viper_linux_getopt__
#define __header_viper_linux_getopt__

#ifndef _WIN32
   #include<getopt.h>
#else

#define no_argument			0x0001
#define required_argument	0x0002

extern char optarg[];

struct option {
	const char* name;
	int has_arg;
	int* flag;
	int val;
};

int getopt_long(int argc, char* const argv[], const char* optstring, const struct option* longopts, int* longindex);

#endif /* _WIN32 */

#endif /* __header_viper_linux_getopt__ */
