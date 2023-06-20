#lang racket

(define (sqrt-iter last-guess next-guess x)
  (if (good-enough? last-guess next-guess)
      next-guess
      (sqrt-iter next-guess
                 (improve next-guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? last-guess next-guess)
  (< (abs (/ (- last-guess next-guess) next-guess)) 0.001))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (sqrt x)
  (sqrt-iter 1.0 (improve 1.0 x) x))

(sqrt 0.0000000000000000000000000003)
