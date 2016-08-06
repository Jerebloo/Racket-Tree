#lang racket

;Below are examples of how the jyu program can be used 

(define b0 (constructBST)) ;creates an empty BST and stores it in b0

(define b1 (addToBST '(5 "one" (2 "two" () ()) (6 "three" () (7 "four" () ()))) 8 "five")) ;adds the (8 "5" () ()) node to the passed in tree 5 "one" (2 "two" () ()) (6 "three" () (7 "four" () ()))) 8 "five")) and stores this new tree in b1

(define search(searchBST b1 2)) ;stores the key and value pair for 2 in search

(define mapped(mapBST b1 string-upcase)) ;stores a BST of identical structure to b1 with uppercase values in mapped

(define (addAllKeys k v lfv rfv)
  (if (null? k) ; no need to check if v,lfv,rfv are also '(); if k is '(), it must have been a call (addAllKeys '() '() '() '())
      0 ; if called with null node, return 0
      (+ k lfv rfv) ; otherwise, add node's key to left-fold-value (sum of keys from left subtree) and right-fold-value (sum of keys from right subtree))
  )
) ;a sample function provided by Dr. Arodz for testing fold

(define theFold (foldBST b1 addAllKeys))

(println b1); prints the BST b1

(println search) ;prints the matching key value pair in search

(println mapped) ;prints the new tree with uppercase values

(println theFold) ;prints 28, the sum of all the keys in b1