#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
	if (argc != 3) {
		printf("Supply two file names as arguments.\n");
		return 1;
	}
	FILE *f, *g;
	f = fopen(argv[1], "rb");
	g = fopen(argv[2], "wb");
	if (f==NULL || g==NULL) {
		printf("Error opening files.\n");
	}
	else {
		unsigned int a;
		unsigned int i = 0;
		unsigned char attack[7] = {0x68, 0x7c, 0x84, 0x04, 0x08, 0xc3, 0xc3};
		while ((a = fgetc(f)) != EOF) {
			if (i < 0x460 || i > (0x460 + 0x6)) {
				fputc(a, g);
			}
			else {
				printf("%d | %hx\n", i, attack[i-0x460]);
				fputc(attack[i-0x460], g);
			}
			i++;
		}
	}
	fclose(f);
	fclose(g);
	return 0;
}
