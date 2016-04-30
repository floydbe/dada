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
		int a;
		unsigned int i = 0;
		char attack[8] = {0x68, 0x7c, 0x84, 0x04, 0x08, 0xc3, 0xc9, 0xc3};
		while ((a = fgetc(f)) != EOF) {
			if (i < 0x45f || i > (0x45f + 0x7)) {
				fputc(a, g);
			}
			else {
				printf("%d | %hx\n", i, attack[i-0x45f]);
				fputc(attack[i-0x45f], g);
			}
			i++;
		}
	}
	fclose(f);
	fclose(g);
	return 0;
}
