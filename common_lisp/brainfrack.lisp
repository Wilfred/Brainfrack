

;; TODO: make this larger after we're done testing.
(defvar *bf-memory* (make-array 100))

(defun bf-eval (program)
  "Execute PROGRAM written in BF."
  (let ((program-index 0)
        (memory-index 0))
    (format t "TODO~%")))

(defun bf-matching-brackets (program)
  "Return a hash-table of opening bracket indices to closing bracket indices
in PROGRAM.

Example:
\(bf-matching-brackets \"[[]]\")
{0: 3, 1: 2}"
  (let ((matches (make-hash-table)))
    (loop for char across program
       for index from 0
       collect (+ 1 index))))

