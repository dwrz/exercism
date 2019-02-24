#include <stdbool.h>
#include <stdio.h>

int length(const char string[])
{
  int i = 0;
  while (string[i] != '\0') {
    i++;
  }
  return i+1; // Account for terminating null character.
}

char lowercase(char* c) {
  // Lowercase only ASCII capital characters.
  if (*c >= 65 && *c <= 90) {
    return *c + 32;
  }
  return *c;
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
  // Lowercase the phrase.
  // We make a copy, since the input is constant.
  char lower_phrase[(length(phrase))];
  copy_phrase(phrase, lower_phrase);
  lowercase_phrase(lower_phrase);
  // Check if the lowercased phrase is an isogram.
  for (int i = 0; i < length(lower_phrase); i++) {
    if (is_symbol_char(lower_phrase[i])) { continue; } // Ignore non-alpha chars.
    for (int j = 0; j < length(lower_phrase); j++) {
      if (is_symbol_char(lower_phrase[j])) { continue; }
      if (j == i) { continue; }
      if (lower_phrase[i] == lower_phrase[j]) {
        return false;
      }
    }
  }
  return true;
}
