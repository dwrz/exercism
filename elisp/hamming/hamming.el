;;; hamming.el --- Hamming (exercism)

;;; Commentary:

;;; Code:

(provide 'hamming)

(defun count-different-chars(s1 s2)
  "Count the number of different characters between two strings, S1 and S2, which must be of equal length."
  (let ((count 0) (i 0))
    (while (< i (length s1))
      (if (not (char-equal (aref s1 i) (aref s2 i)))
          (setq count (+ count 1)))
      (setq i (+ i 1)))
    count))

(defun hamming-distance(s1 s2)
  "Determine the Hamming distance of two strands of DNA.
Expects the strands as two strings, S1 and S2,
which must be of equal length."
  (cond ((string= s1 s2) 0)
        ((eq (length s1) (length s2)) (count-different-chars s1 s2))
        (error  "Strands must be of equal length")))

;;; hamming.el ends here
