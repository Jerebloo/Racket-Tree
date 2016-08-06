#lang racket

;reference
;racket docs used as reference to construct build (similar to struct node)
;racket docs  referenced for functions  first, second, third, fourth, equal?
;racket docs referenced for cond structure
;fold implementation follows the setup in HW3 examples
;list building and recursion follows 403 class note examples
;null? taken from class notes

;Algorithm
;A list builder is defined as build which will create nodes
;4 helper methods are defined which will access information in the current position of the tree
;constructBST  builds an empty tree
;addToBST takes in a Binary search tree a key and a value and builds a new tree , the original tree is copied until
; the appropriate position for the new key is found, then the key and value are placed in a list with 2 null children
; are put in a list in that position
; searchBST checks the root key against the key we are looking for,
; if this key is less or greater than the root key then we pass in the
; left or right hand tree recursively, this is done until a match is found
;or no match is found in which case key is returned only
; mapBST takes in a BST and builds a new BST of the same structure, with the same keys
; but with new values, these new values are determined by the function passed into mapBST
; the way the new BST struture is made is by traversing the passed in BST on the left and right children
;foldBST extracts a key or value depending on the passed in function, from each node in the BST and
;the function is applied to each one(all keys or all values) and returns a single number or string
; it might add all the keys in a tree for example and output one number

(define
  (build k v left right)
  (list k v left right)
  )

(define
  (currentKey BST)
   (first BST)
 )

(define (currentValue BST)
  (second BST)
 )

(define(leftChild BST)
  (third BST)
  )

(define (rightChild BST)
  (fourth BST)
 )

(define
  (constructBST)
       (list '() '() '() '())
        )

(define
  (addToBST BST key value)
 
  (cond
     [(null? BST)
        
        (build key value '() '())
        
        ]
     
       [(< key (currentKey BST) )

        (build (currentKey BST) (currentValue BST) (addToBST (leftChild BST) key value) (rightChild BST))

        ]

       [(> key (currentKey BST) )
         
         (build (currentKey BST) (currentValue BST) (leftChild BST) (addToBST (rightChild BST) key value))
         
        ]
   
        )
       )
    

(define
  (searchBST BST key)
    
(cond
     [
      (null? BST)
      (list key)
      ]
     [
      (equal? key (currentKey BST))
        
        (list key (currentValue BST))
        ]
     
       [(< key (currentKey BST) )
         
        (searchBST (leftChild BST) key)
         ]
       
       [(> key (currentKey BST) )
         
         (searchBST (rightChild BST) key)
         
        ]
        )
     )

(define
  (mapBST BST someFunction)
     (cond
       [(null? BST)
        '()
        ]
       [(not (null? BST))
         (build (currentKey BST) (someFunction (currentValue BST)) (mapBST (leftChild BST) someFunction) (mapBST (rightChild BST) someFunction))
        ]
      )
            )

(define
  (foldBST BST someFunction)
     (cond
       [(null? BST)
        (someFunction '() '() '() '())
        ]
       [
        (not (null? BST))
     
        (someFunction (currentKey BST) (currentValue BST) (foldBST (leftChild BST) someFunction) (foldBST (rightChild BST) someFunction))
        ]
        )
            )