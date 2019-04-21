#include "grains.h"

static int validSquare(int n) {
  if (n >= 1 && n <= 64) return 1;
  return 0;
}

unsigned long long square(int n) {
  if (!validSquare(n)) return 0;
  if (n == 1) return 1;
  return 2llu << (n-2);
}

unsigned long long total() {
  unsigned long long n = 0;
  for (int i = 1; i <= 64; i++) {
    n += square(i);
  }
  return n;
}
