#lang racket
(provide handle)
(define (handle) (define in (read-line))
  (display "You said ")
  (display in)
  (newline))
