;;; two-fer.el --- Two-fer Exercise (exercism)

;;; Commentary:

;;; Code:

(provide 'two-fer)

(defun two-fer(&optional name)
  "Return a twofer phrase as a formatted string.
NAME, if provided, is used to specify the first recipient;
it defaults to 'you'."
  (if (not name) (setq name "you"))
  (format "One for %s, one for me." name))
;;; two-fer.el ends here
