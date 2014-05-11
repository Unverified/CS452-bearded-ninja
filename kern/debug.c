
#include <clock.h>
#include <niklib.h>
#include <iolib.h>

long long worst_try = 0;
long long current_try = 0;
long long last_try = 0;

void debug_init() {
    worst_try = 0;
    clock_t4enable();
    last_try = clock_t4tick();
}

void debug_loop() {
    unsigned int try = clock_t4tick();
    if( try - last_try > worst_try ) {
        worst_try = try - last_try;
    }
    last_try = try;
}

void debug_print( ) {
    setpos( 6, 70 );
    printf( "%d", worst_try );
    setpos( 7, 70 );

    setpos( 8, 70 );
    printf( "%d", last_try );
}


