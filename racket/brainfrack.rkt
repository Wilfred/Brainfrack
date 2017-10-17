#lang racket

(define MAX-CELLS 30000)

;; Convenience arithmetic
(define (1+ x)
  (+ x 1))
(define (1- x)
  (- x 1))

;; Evaluate PROGRAM, a string of brainfuck code.
(define (brainfrack-eval program)
  (define (eval program-idx cells cell-idx)
    (define (current-cell)
      (vector-ref cells cell-idx))

    (when (< program-idx (string-length program))
      (case (string-ref program program-idx)

        ;; Mutating cells.
        [(#\+)
         (vector-set! cells cell-idx
                      (1+ (current-cell)))
         (eval (1+ program-idx) cells cell-idx)]
        [(#\-)
         (vector-set! cells cell-idx
                      (1- (current-cell)))
         (eval (1+ program-idx) cells cell-idx)]

        ;; Moving cell pointer.
        [(#\>)
         (eval (1+ program-idx) cells (1+ cell-idx))]
        [(#\<)
         (eval (1+ program-idx) cells (1- cell-idx))]

        ;; Loops.
        [(#\[)
         (if (zero? (current-cell))
             ;; Step over the loop.
             (eval (1+ (matching-close program program-idx))
                   cells cell-idx)
             ;; Step into the loop.
             (eval (1+ program-idx) cells cell-idx))]
        [(#\])
         ;; Go back to the matching open.
         (eval (matching-open program program-idx) cells cell-idx)]

        ;; I/O
        [(#\.)
         (display (integer->char (current-cell)))
         (eval (1+ program-idx) cells cell-idx)]
        [(#\,)
         (vector-set! cells cell-idx (read-byte))
         (eval (1+ program-idx) cells cell-idx)]

        [else
         ;; Just skip over this character.
         (eval (1+ program-idx) cells cell-idx)])))

  (eval 0 (make-vector MAX-CELLS 0) 0))

;; Given the index of a [ character, return the position of the
;; closing ].
(define (matching-close program idx)
  (define (find current-idx depth)
    (case (string-ref program current-idx)
      [(#\[)
       (find (1+ current-idx) (1+ depth))]
      [(#\])
       (if (= depth 1)
           current-idx
           (find (1+ current-idx) (1- depth)))]

      [else
       ;; Just skip over this character.
       (find (1+ current-idx) depth)]))
  (find idx 0))

;; Finding the [ matching the ] at IDX.
(define (matching-open program idx)
  (define (find current-idx depth)
    (case (string-ref program current-idx)
      [(#\[)
       (if (= depth 1)
           current-idx
           (find (1- current-idx) (1- depth)))]
      [(#\])
       (find (1- current-idx) (1+ depth))]

      [else
       ;; Just skip over this character.
       (find (1- current-idx) depth)]))
  (find idx 0))

(let ([prog (bytes->string/utf-8 (port->bytes))])
  (brainfrack-eval prog))
