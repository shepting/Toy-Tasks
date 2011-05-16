
#include <stdio.h>

union  {
    int integer;
    char character;
    } end_test;

int main(int argc, char argv[])
{
    printf("Starting\n");
    end_test.integer = 1<<3;
    printf("As int: %i\n", end_test.integer);
    printf("As char: %i\n", end_test.character);
    

	return 0;
}