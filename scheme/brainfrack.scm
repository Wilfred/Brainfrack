
(define (instructions program)
  "Given a brainfuck PROGRAM (a string), return a list of chars that
are valid brainfuck instructions."
  (filter
   (lambda (char) (memq char (list #\+ #\- #\< #\> #\. #\, #\[ #\])))
   (string->list program)))
