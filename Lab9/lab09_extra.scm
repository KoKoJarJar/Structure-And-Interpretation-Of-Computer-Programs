;; Extra Scheme Questions ;;


; Q5
(define lst
)

; Q6
(define (composed f g)
  (lambda (x)
    (f (g x)))
)

; Q7
(define (remove item lst)
  (filter (lambda (x) (not (= item x))) lst)
)


;;; Tests
(remove 3 nil)
; expect ()
(remove 3 '(1 3 5))
; expect (1 5)
(remove 5 '(5 3 5 5 1 4 5 4))
; expect (3 1 4 4)

; Q8
(define (no-repeats s)
  (cond
   ((null? s) s)
   (else (cons (car s)
               (filter (lambda (x) (not (= (car s) x)))
                       (no-repeats (cdr s))))))
)

; Q9
(define (substitute s old new)
  (cond
   ((null? s) s)
   ((pair? (car s)) (cons (substitute (car s) old new)
                          (substitute (cdr s) old new)))
   ((eq? old (car s)) (cons new (substitute (cdr s) old new)))
   (else (cons (car s) (substitute (cdr s) old new))))
)

; Q10
(define (sub-all s olds news)
  (cond
   ((null? olds) s)
   (else (substitute (sub-all s (cdr olds) (cdr news))
                     (car olds)
                     (car news))))
)
