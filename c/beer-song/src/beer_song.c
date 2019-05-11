#include <stdio.h>

void verse(char* response, int bottles) {
  if (bottles < 0) {
    return;
  }

  switch (bottles) {
  case 0:
    sprintf(response,
	    "No more bottles of beer on the wall, no more bottles of beer.\n"
	    "Go to the store and buy some more, "
	    "99 bottles of beer on the wall.\n");
    return;
  case 1:
    sprintf(response,
	    "1 bottle of beer on the wall, 1 bottle of beer.\n"
	    "Take it down and pass it around, "
	    "no more bottles of beer on the wall.\n");
    return;
  case 2:
    sprintf(response,
	    "2 bottles of beer on the wall, 2 bottles of beer.\n"
	    "Take one down and pass it around, "
	    "1 bottle of beer on the wall.\n");
    return;
  default:
    sprintf(response,
	    "%d bottles of beer on the wall, %d bottles of beer.\n"
	    "Take one down and pass it around, "
	    "%d bottles of beer on the wall.\n",
	    bottles, bottles, bottles - 1);
    return ;
  }
}

void sing(char *response, int start, int finish) {
  for (int i = start; i >= finish; i--) {
    verse(response, i);
  }

  return ;
}
