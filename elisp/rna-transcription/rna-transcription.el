;;; rna-transcription.el -- RNA Transcription (exercism)

;;; Commentary:

;;; Code:

(provide 'rna-transcription)

(defun transcribe (nucleotide)
"Return the matching RNA pair for DNA NUCLEOTIDE."
  (cond ((char-equal nucleotide ?C) "G")
        ((char-equal nucleotide ?G) "C")
        ((char-equal nucleotide ?A) "U")
        ((char-equal nucleotide ?T) "A")
        ((error "Unrecognized nucleotide"))))

(defun to-rna (dna)
"Transcribe a string representing DNA nucleotides.
Return a string representing RNA nucleotides."
  (cl-loop for nucleotide being the elements of dna
           concat (transcribe nucleotide)))

;;; rna-transcription.el ends here
