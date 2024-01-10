#include<stdio.h>

#include<viper/debug/exceptions.h>
#include<viper/types/tests.h>
#include<viper/math/log.h>
#include<viper/debug/logger.h>

void ExecuteLogTest(ViperTestInfo_t* info, int excpeted, int value, int base) {
	int result = 0;

	ViperTry {
		if (excpeted != (result = ViperLog(value, base))) {
			ViperThrow();
		}
		ViperPrintF("\33[2K\r[ \033[32m Passed \033[0m ] passed test for ViperLog(%i, %i) function : %i\n", value, base, result);
	} ViperCatch {
		info->testFailed++;
		printf("\33[2K\r[ \033[31m Failed \033[0m ] Failed test for ViperLog(%i, %i) function : %i\n", value, base, result);
	}
}

void ExecuteLogTests(ViperTestInfo_t* info) {
	ExecuteLogTest(info, 3,   -1000, 10);
	ExecuteLogTest(info, 2,   -100,  10);
	ExecuteLogTest(info, 1,   -10,   10);
	ExecuteLogTest(info, 0,   -1,    10);
	ExecuteLogTest(info, 0,    0,    10);
	ExecuteLogTest(info, 0,    1,    10);
	ExecuteLogTest(info, 1,    10,   10);
	ExecuteLogTest(info, 2,    100,  10);
	ExecuteLogTest(info, 3,    1000, 10);
}
