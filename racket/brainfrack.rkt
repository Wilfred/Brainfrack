#lang racket

(define MAX-CELLS 1000)

(define (1+ x)
  (+ x 1))
(define (1- x)
  (- x 1))

(define (brainfrack-eval program)
  (define (brainfrack-eval* program-idx cells cell-idx)
    (when (< program-idx (string-length program))
      (case (string-ref program program-idx)
        
        ;; Mutating cells.
        [(#\+)
         (vector-set! cells cell-idx
                      (1+ (vector-ref cells cell-idx)))
         (brainfrack-eval* (1+ program-idx) cells cell-idx)]
        [(#\-)
         (vector-set! cells cell-idx
                      (1- (vector-ref cells cell-idx)))
         (brainfrack-eval* (1+ program-idx) cells cell-idx)]
        
        ;; Moving cell pointer.
        [(#\>)
         (brainfrack-eval* (1+ program-idx) cells (1+ cell-idx))]
        [(#\<)
         (brainfrack-eval* (1+ program-idx) cells (1- cell-idx))]
        
        ;; I/O
        [(#\.)
         (display (integer->char (vector-ref cells cell-idx)))
         (brainfrack-eval* (1+ program-idx) cells cell-idx)]
        
        [else
         ;; Just skip over this character.
         (brainfrack-eval* (1+ program-idx) cells cell-idx)])))
  
  (brainfrack-eval* 0 (make-vector MAX-CELLS 0) 0))
