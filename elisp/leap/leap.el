;;; leap.el --- Leap exercise (exercism)

;;; Commentary:

;;; Code:

(provide 'leap)

(defun leap-year-p (year)
"Return whether a given year is a leap-year."
  (when (zerop (mod year 4))
    (if (zerop (mod year 100))
        (when (zerop (mod year 400)) t)
      t)))

;;; leap.el ends here
