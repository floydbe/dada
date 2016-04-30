
float dot_product(float * __restrict__ v1, float * __restrict__ v2, int length) {
	float result = 0.0;
	int i;
	for (i=0; i<length; i++)
		result += v1[i]*v2[i];
	return result;
}
