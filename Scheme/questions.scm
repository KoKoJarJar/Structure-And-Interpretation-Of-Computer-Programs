(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

; Some utility functions that you may find useful to implement.

(define (cons-all first rests)
  'replace-this-line)

(define (zip pairs)
  'replace-this-line)

;; Problem 17
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 17
  (define (enumerate-helper lst n)
    (cond ((null? lst) lst)
          (else (cons (list n (car lst))
                      (enumerate-helper (cdr lst) (+ n 1))))))
    (enumerate-helper s 0)
  )
  ; END PROBLEM 17

;; Problem 18
;; List all ways to make change for TOTAL with DENOMS
(define (list-change total denoms)
  ; BEGIN PROBLEM 18
  (define (cons-all first rests)
    (map (lambda (x) (cons first x)) rests))
  (cond ((eq? total 0) '(()))
        ((< total 0) '())
        ((null? denoms) '())
        (else (append (cons-all (car denoms) (list-change (- total (car denoms)) denoms))
                      (list-change total (cdr denoms)))))
  )
  ; END PROBLEM 18

(define (zip lst-of-lst)
  (cond ((null? lst-of-lst) '())
        ((null? (car lst-of-lst)) '())
        (else (append (list (map (lambda (x) (car x)) lst-of-lst))
                      (zip (map (lambda (x) (cdr x)) lst-of-lst))))))

;; Problem 19
;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

(define (let-in-lst lst)
  (cond ((null? lst) #f)
        (else (or (let-in-lst (cdr lst)) (equal? 'let (car lst))))))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN PROBLEM 19
         expr
         ; END PROBLEM 19
         )
        ((quoted? expr)
         ; BEGIN PROBLEM 19
         expr
         ; END PROBLEM 19
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 19
           (cond ((let-in-lst params)
                  (cons form (cons params body)))
                 (else
                  (cons form (cons params (let-to-lambda body)))))
           ; END PROBLEM 19
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 19
           (define a (zip values))
           (cons (list 'lambda (car a)
                       (let-to-lambda (car body)))
                 (map let-to-lambda (cadr a)))
           ; END PROBLEM 19
           ))
        (else
         ; BEGIN PROBLEM 19
         (cons (let-to-lambda (car expr)) (let-to-lambda (cdr expr)))
         ; END PROBLEM 19
         )))
