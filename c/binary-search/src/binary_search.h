#ifndef BINARY_SEARCH_H
#define BINARY_SEARCH_H

// binary_search expects:
// val: an integer value to search
// arr[]: an array of *sorted* integers
// len: the length of ARR[]
// If val is found, the function returns a pointer to an array index.
// Otherwise, it returns NULL.
int* binary_search(int val, int arr[], int len);

#endif // BINARY_SEARCH_H
