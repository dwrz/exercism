;;; roman-numerals.el --- roman-numerals Exercise (exercism)

;;; Commentary:

;;; Code:

(provide 'roman-numerals)

(defun greatest-roman-amount (n)
  (cond ((>= n 1000) 1000)
        ((>= n 900) 900)
        ((>= n 500) 500)
        ((>= n 400) 400)
        ((>= n 100) 100)
        ((>= n 90) 90)
        ((>= n 50) 50)
        ((>= n 40) 40)
        ((>= n 10) 10)
        ((>= n 9) 9)
        ((>= n 5) 5)
        ((>= n 4) 4)
        ((>= n 1) 1)))

(defun numeral-for-amount (n)
  (cond ((= n 1000) "M")
        ((= n 900) "CM")
        ((= n 500) "D")
        ((= n 400) "CD")
        ((= n 100) "C")
        ((= n 90) "XC")
        ((= n 50) "L")
        ((= n 40) "XL")
        ((= n 10) "X")
        ((= n 9) "IX")
        ((= n 5) "V")
        ((= n 4) "IV")
        ((= n 1) "I")))

(defun to-roman (n)
"Convert whole number N to roman numeral.
Does not handle numbers greater than 3000."
  (cl-loop until (<= n 0)
           concat (numeral-for-amount (greatest-roman-amount n))
           do (setq n (- n (greatest-roman-amount n)))))

;;; roman-numerals.el ends here
