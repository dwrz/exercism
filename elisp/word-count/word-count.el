;;; word-count.el --- word-count Exercise (exercism)

;;; Commentary:

;;; Code:

(defun extract-words (s)
"Extract lowercased words from S.
Splits on whitespace, removes non alphanumeric characters."
  (split-string (replace-regexp-in-string "[^[:alnum:]_-]" " " (downcase s))))

(defun word-count (s)
"Return an alist word count of words in S."
  (let ((word-count ()))
    (dolist (w (extract-words s) word-count)
      (let ((entry (assoc w word-count)))
        (if entry (cl-incf (cdr entry))
          (push (cons w 1) word-count))))))

(provide 'word-count)
;;; word-count.el ends here
