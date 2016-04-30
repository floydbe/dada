
float dot_product(float * __restrict__ v1, float * __restrict__ v2, int length) {
	float result;
	float dot1 = 0.0;
	float dot2 = 0.0;
	float dot3 = 0.0;
	float dot4 = 0.0;
	int i;
	for (i=0; i+4<=length; i=i+4) {
		dot1 += v1[i]*v2[i];
		dot2 += v1[i+1]*v2[i+1];
		dot3 += v1[i+2]*v2[i+2];
		dot4 += v1[i+3]*v2[i+3];
	}
	result = dot1 + dot2 + dot3 + dot4;
	return result;
}
