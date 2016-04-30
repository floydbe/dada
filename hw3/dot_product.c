
float dot_product(float *v1, float *v2, int length) {
	float result = 0.0;
	int i;
	for (i=0; i<length; i++)
		result += v1[i]*v2[i];
	return result;
}
