#include <stdio.h>
#include "isogram.h"

char lowercase(char c) {
  // Lowercase only ASCII uppercase chars.
  if (c >= 65 && c <= 90) { return c + 32; }
  return c;
}

bool is_symbol_char(char c) {
  // Catch chars that precede or follow alpha chars.
  if (c < 65 || c > 122) { return true; }
  // Catch chars intervening the upper and lowercase alpha chars.
  if (c > 90 && c < 97) { return true; }
  return false;
}

bool is_isogram(const char phrase[]) {
  if (phrase == NULL) { return false; }
  // There are 26 lowercased ASCII alpha chars (97-122).
  // We can use 26 indexes to keep track of each one.
  char char_map[26] = { 0 };
  for (int i = 0; phrase[i] != '\0'; i++) {
    if (is_symbol_char(phrase[i])) { continue; } // Ignore non-alpha chars.
    if (char_map[lowercase(phrase[i]) - 97] != 0) { return false; }
    char_map[lowercase(phrase[i]) - 97]++;
  }
  return true;
}
