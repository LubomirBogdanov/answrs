#include <stdio.h>
#include <stdlib.h>
#include "led.h"
#include "uart.h"
#include "print.h"
#include "sleep.h"
#include "autoconf.h"

extern void __gcov_info_to_gcda (const struct gcov_info *__info,
		     void (*__filename_fn) (const char *, void *),
		     void (*__dump_fn) (const void *, unsigned, void *),
		     void *(*__allocate_fn) (unsigned, void *),
		     void *__arg);

extern void __gcov_filename_to_gcfn (const char *__filename,
			 void (*__dump_fn) (const void *, unsigned, void *),
			 void *__arg);

extern const struct gcov_info *const __gcov_info_start[];
extern const struct gcov_info *const __gcov_info_end[];

static const unsigned char char_a = 'a';

static inline unsigned char* encode(unsigned char c, unsigned char buf[2]){
  buf[0] = c % 16 + char_a;
  buf[1] = (c / 16) % 16 + char_a;
  return buf;
}

static void dump(const void *d, unsigned n, void *arg){
  (void)arg;
  const unsigned char *c = d;
  unsigned char buf[2];

  for (unsigned i = 0; i < n; ++i){
    fwrite (encode (c[i], buf), sizeof (buf), 1, stderr);
  }
}

static void filename(const char *f, void *arg){
  __gcov_filename_to_gcfn (f, dump, arg);
}

static void* allocate(unsigned length, void *arg){
  (void)arg;
  return malloc(length);
}

static void dump_gcov_info(void){
  const struct gcov_info *const *info = __gcov_info_start;
  const struct gcov_info *const *end = __gcov_info_end;

  // Obfuscate variable to prevent compiler optimizations.  
  __asm__ ("" : "+r" (info));

  while (info != end){
    void *arg = NULL;
    __gcov_info_to_gcda (*info, filename, dump, allocate, arg);
    fputc ('\n', stderr);
    ++info;
  }
}


extern float asm_rms(float dig3, float dig2, float dig1, float dig0);

void my_func_3(void){
	volatile int a = 3, b = 30, c;
	int arr[20];

	c = a + b;
	
	for(int i = 0; i < 20; i++){
		if((i%2) == 0){
			arr[i] = 0x33;
		}
		else{
			arr[i] = 0x55;
		}
       }
}

void my_func_2(void){
	volatile int a = 2, b = 20, c;

	c = a + b;

	my_func_3();
}

void my_func_1(void){
	volatile int a = 1, b = 10, c;

	c = a + b;

	my_func_2();
}

int main(void){
	float val3 = 4.002503;
	float val2 = 4.233456;
	float val1 = 4.789317;
	float val0 = 4.220734;
	float my_result;
	//volatile int i;
	
    led_init();
    uart_init();

	my_result = asm_rms(val3, val2, val1, val0);

	//Expected output: 4.321294158
	printf("The result is --> %12.6f\n", my_result);
	
	my_func_1();
	
	dump_gcov_info();

	while (1){
        	led_set();
        	//usleep(1000000);
        	for(volatile int i = 0; i < 1000000; i++){ }
        	led_clear();        	
        	//usleep(1000000);
        	for(volatile int i = 0; i < 1000000; i++){ }
	}
}

