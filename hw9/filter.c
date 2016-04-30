#include <stdio.h>

int main()
{
    int c = getchar();
    while (c != EOF) {
        printf("%02hx", c);
        c = getchar();
    }
}
