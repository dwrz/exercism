;;; anagram.el --- Anagram (exercism)

;;; Commentary:

;;; Code:

(provide 'anagram)

(defun get-char-count(w)
  "Return an associative list of character counts for W."
  (let ((char-list (mapcar (lambda (char) (string char)) w))
        (char-count ()))
    ;; Build an associative list from the character list.
    (dolist (char char-list char-count)
      (if (assoc char char-count)
          (setcdr (assoc char char-count)
                  (1+ (cdr (assoc char char-count))))
        (setq char-count (cons (cons char 1) char-count))))))

(defun equal-char-count(char-count comparison-char-count)
  "Return t if the submitted character counts are equal, false otherwise.
CHAR-COUNT and COMPARISON-CHAR-COUNT should be alists in (character . count) format."
  (let ((are-equal t))
    (dolist (char-count char-count are-equal)
      (if (not are-equal) nil)
      (if (assoc (car char-count) comparison-char-count)
          (if (not (equal
                    (cdr char-count)
                    (cdr (assoc (car char-count) comparison-char-count))))
              (setq are-equal nil))
        (setq are-equal nil)))))

(defun anagrams-for(word anagrams)
  (let ((candidates ())
        (word-char-count (make-char-count word)))
    (dolist (candidate anagrams candidates)
      (if (and
           (not (string-equal word candidate))
           (equal (length word) (length candidate))
           (compare-char-counts word-char-count (make-char-count candidate)))
          (if (> (length candidates) 0)
              (add-to-list 'candidates candidate t)
            (setq candidates (cons candidate nil)))))))

;;; anagram.el ends here
