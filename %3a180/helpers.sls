(library (srfi :180 helpers)
  (export %read-error?
          valid-number?)
  (import (rnrs (6))
          (srfi :115 regexp))

  (define %read-error? i/o-read-error?)

  (define (valid-number? string)
    ;; based on https://stackoverflow.com/a/13340826/140837
    (regexp-matches '(seq
                      (? #\-)
                      (or #\0 (seq (- numeric #\0)
                                   (* numeric)))
                      (? (seq #\. (+ numeric)))
                      (? (seq (or #\e #\E)
                              (? (or #\- #\+))
                              (+ numeric))))
                    string))

  )
