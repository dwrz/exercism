;;; grains.el --- Grains exercise (exercism)

;;; Commentary:
;;; I solved this problem on the C track. There, the solution was
;;; simpler: simply shift an unsigned long long to get the number of
;;; grains at square n.
;;;
;;; In Emacs, that approach doesn't seem to work. Only 30 bits are used
;;; for integers, resulting in overflows above square 60.
;;;
;;; The solution, if one wants to calculate it, seems to be to rely on
;;; the calc package to calculate bigger numbers. The functions
;;; calculate-square and calculate-total rely on that approach.
;;;
;;; However, it also occurred to me that the values here are known,
;;; limited, and not likely to change anytime soon. By using contants,
;;; we can get constant time determination of the number of grains for
;;; a square. The functions used by the tests, square and total, simply
;;; return constant values, with the number of grains for a square
;;; relying on a vector that matches the n-th index to the corresponding
;;; grains.
;;;
;;; Emacs itself was useful in effectuating this solution. I used a
;;; macro to evaluate calculate-square for n, and then insert the
;;; results in this buffer. There's probably a more elegant way to do
;;; this in Emacs, but this approach was adequate for the task.
;;; Sometimes, making the programmer's life easier can lead to more
;;; efficient code.

;;; Code:

(require 'calc)

(defun calculate-square(n)
  "Return the number of grains at square N. Use left shifts when n is equal to or below 60, and calc for numbers up to 65."
  (cond ((< n 0) 0)
	((> n 65) 0)
	((<= n 60) (lsh 1 (- n 1)))
	(t (string-to-number (calc-eval (format "2^%d" (1- n)))))))

(defun calculate-total()
  "Return the total number of grains on a chessboard with 64 squares."
  (1- (square 65)))

(defvar grains [0
		1
		2
		4
		8
		16
		32
		64
		128
		256
		512
		1024
		2048
		4096
		8192
		16384
		32768
		65536
		131072
		262144
		524288
		1048576
		2097152
		4194304
		8388608
		16777216
		33554432
		67108864
		134217728
		268435456
		536870912
		1073741824
		2147483648
		4294967296
		8589934592
		17179869184
		34359738368
		68719476736
		137438953472
		274877906944
		549755813888
		1099511627776
		2199023255552
		4398046511104
		8796093022208
		17592186044416
		35184372088832
		70368744177664
		140737488355328
		281474976710656
		562949953421312
		1125899906842624
		2251799813685248
		4503599627370496
		9007199254740992
		18014398509481984
		36028797018963968
		72057594037927936
		144115188075855872
		288230376151711744
		576460752303423488
		1152921504606846976
		2305843009213693952
		4611686018427387904
		9223372036854775808]
  "Vector containing the number of grains for a square with the corresponding index.")

(defun square(n)
  "Return the number of grans at square n; 0 for negative numbers and numbers above 64."
  (cond ((< n 0) 0)
	((> n 64) 0)
	(t (aref grains n))))

(defun total()
  "Return the total number of grains on a chessboard with 64 squares."
  18446744073709551616)

(provide 'grains)
;;; grains.el ends here
