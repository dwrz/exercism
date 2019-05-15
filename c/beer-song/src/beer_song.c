#include <stdio.h>

int verse(char* response, int bottles) {
  if (bottles < 0) {
    return 0;
  }

  switch (bottles) {
  case 0:
    return sprintf(response,
		   "No more bottles of beer on the wall, "
		   "no more bottles of beer.\n"
		   "Go to the store and buy some more, "
		   "99 bottles of beer on the wall.\n");

  case 1:
    return sprintf(response,
		   "1 bottle of beer on the wall, "
		   "1 bottle of beer.\n"
		   "Take it down and pass it around, "
		   "no more bottles of beer on the wall.\n");

  case 2:
    return sprintf(response,
		   "2 bottles of beer on the wall, "
		   "2 bottles of beer.\n"
		   "Take one down and pass it around, "
		   "1 bottle of beer on the wall.\n");

  default:
    return sprintf(response,
		   "%d bottles of beer on the wall, "
		   "%d bottles of beer.\n"
		   "Take one down and pass it around, "
		   "%d bottles of beer on the wall.\n",
		   bottles, bottles, bottles - 1);

  }
}

void sing(char *response, int start, int finish) {
  char *origin = response;

  for (int i = start; i >= finish; i--) {
    int charsAdded = verse(response, i);
    response += charsAdded;

    // Add a newline between verses,
    // except for the last verse.
    if (i != finish) {
      sprintf(response, "\n");
      response += 1;
    }
  }

  response = origin;
}
