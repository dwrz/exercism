#include <stdio.h>
#include <string.h>

int compute(char* s1, char* s2) {
  if (s1 == NULL || s2 == NULL || strlen(s1) != strlen(s2)) {
    return -1;
  }
  int distance = 0;
  for (int i = 0; s1[i] != '\0'; i++) {
    if (s1[i] != s2[i]) {
      distance++;
    }
  }
  return distance;
}
