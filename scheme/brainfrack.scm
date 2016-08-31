
;; Given a brainfuck PROGRAM (a string), return a list of chars that
;; are valid brainfuck instructions.
(define (instructions program)
  (filter
   (lambda (char) (memq char (list #\+ #\- #\< #\> #\. #\, #\[ #\])))
   (string->list program)))
