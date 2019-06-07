#include <stdio.h>

// The sum of the first N natural numbers can be calculated as
// N * (N + 1) / 2. To get the square, we multiply the sum with itself.
// This formula saves us from having to loop up to N.
int square_of_sum(int n) {
	return ((n * (n + 1)) / 2) * ((n * (n + 1)) / 2);
}

// The sum of the squares of the first N natural numbers can be
// calculated as (n * (n + 1) * ((2 * n) + 1)) / 6.
// This formula saves us from having to loop up to N.
int sum_of_squares(int n) {
	return (n * (n + 1) * ((2 * n) + 1)) / 6;
}

int difference_of_squares(int n) {
	return square_of_sum(n) - sum_of_squares(n);
}
