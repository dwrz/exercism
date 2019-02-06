;;; leap.el --- Leap exercise (exercism)

;;; Commentary:

;;; Code:

(provide 'leap)

(defun leap-year-p (year)
"Return whether a given year is a leap-year."
  (when (= (mod year 4) 0)
    (if (= (mod year 100) 0)
        (when (= (mod year 400) 0) t)
      t)))

;;; leap.el ends here
