;;; anagram.el --- Anagram (exercism)

;;; Commentary:

;;; Code:

(require 'cl)

(provide 'anagram)

(defun make-char-count(s)
  (let ((char-list (mapcar (lambda (char) (string char)) s))
        (char-counts ()))
    ;; Build an associative list from the character list.
    (dolist (char char-list char-counts)
      (if (assoc char char-counts)
          (setcdr (assoc char char-counts)
                  (1+ (cdr (assoc char char-counts))))
        (setq char-counts (cons (cons char 1) char-counts))))))

(defun compare-char-counts(char-counts comparison-char-counts)
  (let ((are-equal t))
    (dolist (char-count char-counts are-equal)
      (if (not are-equal) nil)
      (if (assoc (car char-count) comparison-char-counts)
          (if (not (equal
                    (cdr char-count)
                    (cdr (assoc (car char-count) comparison-char-counts))))
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
