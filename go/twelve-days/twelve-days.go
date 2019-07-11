// Package twelve outputs the lyrics to The Twelve Days of Christmas.
package twelve

import (
	"fmt"
)

var ordinals = [13]string{
	"zeroth",
	"first",
	"second",
	"third",
	"fourth",
	"fifth",
	"sixth",
	"seventh",
	"eighth",
	"ninth",
	"tenth",
	"eleventh",
	"twelfth",
}

var gifts = [13]string{
	"a null pointer",
	"a Partridge in a Pear Tree",
	"two Turtle Doves",
	"three French Hens",
	"four Calling Birds",
	"five Gold Rings",
	"six Geese-a-Laying",
	"seven Swans-a-Swimming",
	"eight Maids-a-Milking",
	"nine Ladies Dancing",
	"ten Lords-a-Leaping",
	"eleven Pipers Piping",
	"twelve Drummers Drumming",
}

func giftsForDay(day int) string {
	switch day {
	case 0, 1:
		return gifts[day]
	case 2:
		return fmt.Sprintf(
			"%s, and %s",
			gifts[day],
			gifts[day-1],
		)
	default:
		return fmt.Sprintf(
			"%s, %s",
			gifts[day],
			giftsForDay(day-1),
		)
	}
}

// Verse returns the matching verse for the inputted day.
// Day must be an integer between 1 and 12.
func Verse(day int) string {
	if day < 0 || day > 12 {
		return ""
	}
	return fmt.Sprintf(
		"On the %s day of Christmas my true love gave to me: %s.",
		ordinals[day],
		giftsForDay(day),
	)
}

// Song returns the text of the song "Twelve Days of Christmas".
// Its verses are separated by newlines.
func Song() (song string) {
	for day := 1; day <= 12; day++ {
		song += fmt.Sprintf("%s\n", Verse(day))
	}
	return
}
