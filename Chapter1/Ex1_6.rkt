;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Ex1_6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;The if and cond forms calculate their brancher in lazy way. And you totally can you cond instead of if and otherwise way too.
;But there is a problem with a new function-wrapper. When you pass anything in a function (and new-if is a function) than you should be expect that its arguments will be calculating before calculationg function result
;And sqrt-iter is a recursive function that pass sqrt-iter inside itself. Since it passes not into "if" or a "cond" but a function, it will calculate recursive call thus entering into endless recursive loop