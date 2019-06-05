#include <stdio.h>
#include <math.h>

int square_of_sum(int n) {
	int sum = (int) (n * ((n * 0.5) + 0.5));
	return pow(sum, 2);
}

int sum_of_squares(int n) {
	printf("%d\n", n);
	return n;
}

int difference_of_squares(int n) {
	printf("%d\n", n);
	return square_of_sum(n) - sum_of_squares(n);
}
