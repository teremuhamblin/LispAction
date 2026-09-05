(in-package :lispaction)

(defun assert-equal (expected actual &optional (msg ""))
  (unless (equal expected actual)
    (error "ASSERT-FAILED ~A: expected ~A, got ~A"
           msg expected actual)))

(defun run-tests ()
  (let ((it (make-interpreter)))
    (assert-equal 6 (eval-expr "(+ 1 2 3)" it) "add")
    (assert-equal 24 (eval-expr "(* 2 3 4)" it) "mul")
    (assert-equal 1 (eval-expr "(- 2 1)" it) "sub")
    (assert-equal 2 (eval-expr "(/ 4 2)" it) "div")
    (format t "All tests OK.~%")))

;; Pour lancer les tests:
;; (asdf:load-system "lispaction")
;; (lispaction:run-tests)
