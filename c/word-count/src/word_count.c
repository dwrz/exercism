#include <ctype.h>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>

#include "word_count.h"

const char *DELIMITERS = " ..,\n:!@#$%^&*()[]{}";

int word_count(const char *input_text, word_count_word_t *words) {
  int unique_words = 0;
  // Zero out the buffer; otherwise values will persist across invocations.
  memset(words, 0, sizeof(word_count_word_t) * MAX_WORDS);
  // strtok modifies strings. We'll use a copy, which we'll lowercase.
  char copy_text[strlen(input_text)];
  strcpy(copy_text, input_text);
  lowercase(copy_text);
  // Main loop -- tokenize and process copy_text.
  for (char *token = strtok(copy_text, DELIMITERS);
       token != NULL;
       token = strtok(NULL, DELIMITERS)) {
    if (unique_words > MAX_WORDS) {
      return EXCESSIVE_NUMBER_OF_WORDS;
    }
    if (strlen(token) > MAX_WORD_LENGTH) {
      return EXCESSIVE_LENGTH_WORD;
    }
    process_token(&unique_words, token, words);
  }
  return unique_words;
}

void process_token(int *unique_words,
                   char *token,
                   word_count_word_t *words) {
  while (is_quoted_word(token)) { // Strip the quotes from the string.
    token++; // Start at the char after the quote.
    token[strlen(token)-1] = '\0'; // Terminate at the last quote.
  }
  bool found = increment_seen_words(token, *unique_words, words);
  if (!found) {
    words += (*unique_words);
    strcpy(words -> text, token);
    words -> count = 1;
    (*unique_words)++;
  }
}

bool increment_seen_words(char *token,
                         int unique_words,
                         word_count_word_t *words) {
  for (int i = 0; i < unique_words; i++) {
    if (strcmp(token, words[i].text) == 0) {
      words[i].count++;
      return true;
    }
  }
  return false;
}

bool is_quoted_word(char *token) {
  return (is_quote_char(token[0]) &&
          is_quote_char(token[strlen(token)-1]));
}

bool is_quote_char(char c) {
  switch (c) {
  case '\'':
    return true;
  case '"':
    return true;
  }
  return false;
}

void lowercase(char *s) {
  for(int i = 0; s[i]; i++){
    s[i] = tolower(s[i]);
  }
}
