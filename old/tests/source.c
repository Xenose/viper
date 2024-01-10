#include<stdio.h>

#include<viper.h>

#include<viper/types/tests.h>

#include"io/printer.c"
#include"utils/integer.c"
#include"math/log.c"


int Main(int arc, char* const* arv) {
	ViperTestInfo_t info = { 0 };

	system("clear");

	ExecuteItoaTest(&info);
	ExecutePrintTest(&info);
	ExecuteLogTests(&info);

	printf("\n\n\tViper Engine %i of %i failed\n\n\n\n", info.testFailed, info.testTotal);
}

