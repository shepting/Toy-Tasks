
#include <stdio.h>

union  {
    int integer;
    char character;
    } end_test;

void test_as_char(){
    // Number with ASCII letters: A B C D as the four chars
    // If D first, it's little endian if A first it's big endian
    int number = 0x61626364;
    char *ch_ptr = (char *)&number;
    
    printf("Number %c\n", *(ch_ptr));

    }

int main(int argc, char *argv[])
{
    printf("Starting\n");
    end_test.integer = 1<<3;
    printf("As int: %i\n", end_test.integer);
    printf("As char: %i\n", end_test.character);
    

	return 0;
}
