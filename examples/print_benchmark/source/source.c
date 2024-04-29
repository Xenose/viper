
#include<stdio.h>

#include<viper/core/io/printer.h>
#include<viper/core/debug/benchmark.h>

int main(int arc, char* const* arv) {
	const int count = 1000000;

	ViperBenchmark_t sBench = { 0 };
	ViperBenchmark_t vBench = { 0 };

	// stdio benchmark

	ViperBenchmarkStart(&sBench);
	
	for (int i = 0; i < count; i++) {
		printf("Hello %i\n", i);
	}
	
	ViperBenchmarkStop(&sBench);

	// viper benchmark

	ViperBenchmarkStart(&vBench);

	for (int i = 0; i < count; i++) {
		ViperPrintF("Hello %i\n", i);
	}

	ViperBenchmarkStop(&vBench);


	// results
	
	printf("\nstdio s : %li m : %li n : %li\nviper s : %li m : %li n : %li\n",
			vBench.seconds, vBench.secondsMicro, vBench.secondsNano,
			sBench.seconds, sBench.secondsMicro, sBench.secondsNano
			);

	return 0;
}
