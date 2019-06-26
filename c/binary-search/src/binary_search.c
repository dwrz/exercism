#include <stdio.h>
#include "binary_search.h"

int* binary_search(int val, int arr[], int len) {
	if (arr == NULL) return NULL;
	if (len == 0) return NULL;

	// Base case -- we found the value.
	if (arr[len/2] == val) {
		return &arr[len/2];
	}

	// The middle value is smaller than our search.
	// Recurse into the upper half of the array.
	if (arr[len/2] < val) {
		return binary_search(val, &arr[len/2] + 1, len/2);
	}

	// The middle value is larger than our search.
	// Recurse into the lower half of the array.
	if (arr[len/2] > val) {
		return binary_search(val, arr, len/2);
	}

	return NULL; // We weren't able to find the value.
}
