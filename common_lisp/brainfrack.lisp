

;; TODO: make this larger after we're done testing.
(defvar *bf-memory* (make-array 100))

(defun bf-eval (program)
  "Execute PROGRAM written in BF."
  (let ((program-index 0)
        (memory-index 0))
    (loop while (< program-index (length program)) do
         (case (elt program program-index)
           (#\+ (incf (elt *bf-memory* memory-index))
                (incf program-index))
           (#\- (decf (elt *bf-memory* memory-index))
                (incf program-index))
           (#\> (incf memory-index)
                (incf program-index))
           (#\< (decf memory-index)
                (incf program-index))
           ;; Skip over comments.
           (t (incf program-index))))))

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

