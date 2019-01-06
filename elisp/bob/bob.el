;;; bob.el --- Bob exercise (exercism)

;;; Commentary:
;;; Bob implements categorical responses to queries.

;;; Code:

(provide 'bob)

(require 'subr-x)

(defun is-all-caps(s)
  "Determine whether a string, S, is all capitalized. Return nil if a string has no alpha characters."
  (let ((case-fold-search nil)) ; make the regex case-sensitive
    (and (not (string-match-p "[[:lower:]]" s))
         (not (equal (upcase s) (downcase s)))
         (> (length s)0))))

(defun is-forceful-question(formatted-query)
  "Determine whether FORMATTED-QUERY is a forceful question;
i.e., all capitals and ending in a question mark."
  (and (is-all-caps (substring formatted-query 0 -1))
       (is-question formatted-query)))

(defun is-question(formatted-query)
  "Determine whether FORMATTED-QUERY is a question;
i.e., ending with a question mark."
  (string-suffix-p "?" formatted-query))

(defun is-shouting(formatted-query)
  "Determine whether FORMATTED-QUERY is shouting;
i.e., either all capitals only or all capitals ending with an exclamation
mark."
  (if (not (is-question formatted-query))
      (cond ((is-all-caps formatted-query) t)
            ((and (is-all-caps (substring formatted-query 0 -1))
                  (string-suffix-p "!" formatted-query)) t))))

(defun is-silence(formatted-query)
  "Determine whether FORMATTED-QUERY is silence; i.e., of zero length."
  (= (length formatted-query) 0))

(defun response-for(query)
  "Determine the response to QUERY.
Begins by trimming whitespace, then checking the QUERY type on a
case-by-case basis."
  (let ((formatted-query (string-trim query)))
    (cond ((is-silence formatted-query) "Fine. Be that way!")
          ((is-forceful-question formatted-query)
           "Calm down, I know what I'm doing!")
          ((is-shouting formatted-query) "Whoa, chill out!")
          ((is-question formatted-query) "Sure.")
          (t "Whatever."))))

;;; bob.el ends here
