; Question 3
; Write a procedure switch that takes a sentence as its argument and returns a sentence in which every instance of the words I or me is replaced by you, while every instance of you is replaced by me except at the beginning of the sentence, where it’s replaced by I.
; (Don’t worry about capitalization of letters.) Example:
; (switch ’(You told me that I should wake you up))
; (i told you that you should wake me up)

; change you to i (at first place)
(define (change-str-first-place x) 
    (cond
        ((eq? x 'me) 'you)
        ((eq? x 'I) 'you)
        ((eq? x 'You) 'i)
        ((eq? x 'you) 'i)
        (else x)
    )
)

; change me and i to you, you to me (at rest place)
(define (converter y)
    (cond 
        ((eq? y 'me) '(you))
        ((eq? y 'I) '(you))
        ((eq? y 'you) '(me))
        ((eq? y 'You) '(me))
        (else y)
    )
)

(define (change-str-rest x) 
    (cons (converter (car x)) (change-str-rest (cdr x)))
)

; get complete converted sentence
(define (switch x) 
    (if (null? x)
        '()
        (cons (change-str-first-place (car x)) (change-str-rest (cdr x)))
    )
)

; 錯很多，run 不起來，應該是語法有寫錯，但大概的想法是把句子的第一個分開算，其他的用遞迴
