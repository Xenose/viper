#include "viper/debug/exceptions.h"
#include "viper/types/tests.h"
#include<stdio.h>
#include<limits.h>
#include<viper/utils/integer.h>
#include<viper/debug/logger.h>
#include<viper/io/printer.h>


void ExecuteItoaCrashTest(ViperTestInfo_t* info, int64_t value) {
	char buffer[1024] = { 0 };
	info->testTotal++;

	ViperTry {
		ViperItoa(value, buffer, 1024, 10);
		ViperPrintF("\33[2K\r[ \033[32m Passed \033[0m ] passed test for Itoa function : %s\n", buffer);
	} ViperCatch {
		info->testFailed++;
		printf("\33[2K\r[ \033[31m Failed \033[0m ] Failed test for Itoa function : %li\n", value);
	}
}

void ExecuteItoaCompersionTest(ViperTestInfo_t* info, char const* str, int64_t value) {
	char buffer[1024] = { 0 };
	info->testTotal++;

	ViperTry {
		ViperItoa(value, buffer, 1024, 10);

		if (0 != strcmp(str, buffer)) {
			ViperThrow();
		}

		ViperPrintF("\33[2K\r[ \033[32m Passed \033[0m ] passed test for Itoa comparison function : %s\n", buffer);
	} ViperCatch {
		info->testFailed++;
		printf("\33[2K\r[ \033[31m Failed \033[0m ] Failed test for Itoa compiles function : %li != %s\n", value, buffer);
	}
}

void ExecuteItoaAtoiTest(ViperTestInfo_t* info, int64_t min, int64_t max) {
	int64_t out = 0;
	int64_t i = 0;
	char buffer[1024] = { 0 };
	info->testTotal++;

	ViperTry {
		for (i = min; i <= max; i++) {
			memset(buffer, 0, 1024);
			ViperItoa(i, buffer, 1024, 10);
			out = ViperAtoi(buffer);

			if (i != out) {
				printf("%li %li\n", i, out);
				ViperThrow();
			}
		}

		ViperPrintF("\33[2K\r[ \033[32m Passed \033[0m ] passed test for Itoa / Atoi comparison: %i to %i\n", min, max);
	} ViperCatch {
		info->testFailed++;
		printf("\33[2K\r[ \033[31m Failed \033[0m ] Failed test for Itoa / Atoi comparison %li\n", i);
	}
}

/**
 * This function is used to test all the integer
 * functions and insure the quality is up to
 * spec.
 */
void ExecuteItoaTest(ViperTestInfo_t* info) {
	ExecuteItoaCrashTest(info, 0);
	ExecuteItoaCrashTest(info, -100);
	ExecuteItoaCrashTest(info, 100);
	ExecuteItoaCrashTest(info, INT_MIN);
	ExecuteItoaCrashTest(info, INT_MIN + 1);
	ExecuteItoaCrashTest(info, INT_MAX);
	ExecuteItoaCrashTest(info, INT_MAX - 1);

	ExecuteItoaCompersionTest(info, "0", 0);
	ExecuteItoaCompersionTest(info, "100", 100);
	ExecuteItoaCompersionTest(info, "-100", -100);

	ExecuteItoaAtoiTest(info,  10,		10000);
	ExecuteItoaAtoiTest(info,  1,			10000);
	ExecuteItoaAtoiTest(info,  0,			10000);

	ExecuteItoaAtoiTest(info,  0,			0);

	ExecuteItoaAtoiTest(info, -100,		-1);
	ExecuteItoaAtoiTest(info, -1,			0);
	ExecuteItoaAtoiTest(info, -10000,	0);
	ExecuteItoaAtoiTest(info, -10000,	10000);
}
