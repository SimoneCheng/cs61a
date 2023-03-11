## Question 1

**Exercise 1.6:**

Alyssa P. Hacker doesn’t see why if needs to be provided as a special form. “Why can’t I just define it as an ordinary procedure in terms of cond?” she asks. Alyssa’s friend Eva Lu Ator claims this can indeed be done, and she defines a new version of if:

```scheme
(define (new-if predicate
                then-clause
                else-clause)
  (cond (predicate then-clause)
        (else else-clause)))
```

Eva demonstrates the program for Alyssa:

```scheme
(new-if (= 2 3) 0 5)
5
```

```scheme
(new-if (= 1 1) 0 5)
0
```

Delighted, Alyssa uses new-if to rewrite the square-root program:

```scheme
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))
```

What happens when Alyssa attempts to use this to compute square roots? Explain.

## Thinking

原本的寫法是像這樣：

```scheme
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))
```

如果符合 `good-enough? guess x` 這項敘述的話，會執行 `guess`，不符合的話會執行 `(sqrt-iter (improve guess x) x)` （再呼叫自己一次）。所以在執行這個 function 的時候會一直呼叫自己直到 `good-enough? guess x === true` 才會停。

現在題目要把 if 換掉改成一個自己新寫的 new-if：

```scheme
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))
```

把 new-if 的 code 直接帶進來看看，上面的 code 會等同於下面的寫法：

```scheme
(define (sqrt-iter guess x)
  (cond ((good-enough? guess x) guess)
        (else (sqrt-iter (improve guess x) x))
  )
)
```

然後再來分析這段 code 和最一開始的 code 有何不同。此時就會發現 `cond` 和 `if` 好像沒有什麼不同啊？查了很久才發現自己理解錯誤...

## Rethinking

## Resource

- https://stackoverflow.com/questions/1171252/whats-the-explanation-for-exercise-1-6-in-sicp
- https://sicp-solutions.net/post/sicp-solution-exercise-1-6/