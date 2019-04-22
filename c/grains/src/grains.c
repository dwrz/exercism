#include "grains.h"

unsigned long long square(int n) {
  if (n < 1 || n > 64) return 0;
  return 1ull << (n-1);
}

unsigned long long total() {
  unsigned long long n = 0;
  for (int i = 1; i <= 64; i++) {
    n += square(i);
  }
  return n;
}
