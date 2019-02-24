#include <stdbool.h>
#include <stdio.h>

int length(const char string[]) {
  int i = 0;
  while (string[i] != '\0') {
    i++;
  }
  return i+1; // Account for terminating null character.
}

char lowercase(char c) {
  // Lowercase only ASCII capital characters.
  if (c >= 65 && c <= 90) {
    return c + 32;
  }
  return c;
}

bool is_symbol_char(char c) {
  // Ignore symbols that precede alpha chars.
  if (c < 65 || c > 122) {
    return true;
  }
  // Ignore symbols intervening the upper and lowercase chars.
  if (c > 90 && c < 97) {
    return true;
  }
  return false;
}

bool is_isogram(const char phrase[]) {
  if (phrase == NULL) { return false; }
  if (length(phrase) == 0) { return true; }
  // There are 26 lowercased ASCII alpha chars.
  // We can use 26 indexes to keep track of each one.
  char char_map[26] = { 0 };
  for (int i = 0; i < length(phrase); i++) {
    if (is_symbol_char(phrase[i])) { continue; } // Ignore non-alpha chars.
    if (char_map[lowercase(phrase[i]) - 97] != 0) {
      return false;
    }
    char_map[lowercase(phrase[i]) - 97]++;
  }
  return true;
}
