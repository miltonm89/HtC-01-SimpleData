#lang htdp/bsl

(require test-engine/racket-tests)

(check-expect true true)
(check-expect false false)
(check-expect false true)
(check-expect true false)

(test)
