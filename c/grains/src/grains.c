#include "grains.h"

const int NUMBER_OF_SQUARES = 64;

// square returns the number of grains to be placed at the nth square.
// An unsigned long long is necessary to hold the value of 2^64, which
// on 64-bit is equivalent to the max value of that type (ULLONG_MAX).
// square returns 0 for non-existing squares.
unsigned long long square(int n) {
  if (n < 1 || n > NUMBER_OF_SQUARES) return 0;
  // A left shift of 0 leaves a number unchanged.
  // Otherwise, each left shift of 1 doubles the number;
  // i.e, 1 << 0 = 1, 1 << 1 = 2, 1 << 2 = 4, etc.
  // 00000001 = 1, 00000010 = 2, 000000100 = 4, etc.
  // There is one grain at the first square, not 2.
  // ∴, we subtract one from n to get the correct number of shifts.
  return 1ull << (n-1);
}

unsigned long long total() {
  unsigned long long n = 0;
  // Add up all the squares.
  for (int i = 1; i <= NUMBER_OF_SQUARES; i++) {
    n += square(i);
  }
  return n;
}
