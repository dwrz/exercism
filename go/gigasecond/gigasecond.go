// Package gigasecond provides functions that modify time by gigasecond values.
package gigasecond

import "time"

// AddGigasecond returns a time that is one gigasecond into the future from the
// input time, t.
func AddGigasecond(t time.Time) time.Time {
	return t.Add(1000000000 * time.Second)
}
