(in-package :lispaction)

(defstruct interpreter
  (env (make-hash-table :test 'equal)))

(defun make-interpreter ()
  (let ((it (make-interpreter)))
    (setf (gethash "+" (interpreter-env it))
          (lambda (&rest xs) (reduce #'+ xs)))
    (setf (gethash "-" (interpreter-env it))
          (lambda (x &optional y)
            (if y (- x y) (- x))))
    (setf (gethash "*" (interpreter-env it))
          (lambda (&rest xs) (reduce #'* xs :initial-value 1)))
    (setf (gethash "/" (interpreter-env it))
          (lambda (x y) (/ x y)))
    it))

(defun tokenize (expr)
  (let ((chars (coerce expr 'list))
        (tokens '())
        (current ""))
    (labels ((flush ()
               (when (> (length current) 0)
                 (push (string-trim " " current) tokens)
                 (setf current ""))))
      (dolist (c chars)
        (cond
          ((member c '(#\( #\)))
           (flush)
           (push (string c) tokens))
          ((char= c #\space)
           (flush))
          (t (setf current (concatenate 'string current (string c))))))
      (flush)
      (nreverse tokens))))

(defun parse (tokens)
  (labels ((parse-expr (tokens)
             (let ((token (pop tokens)))
               (cond
                 ((string= token "(")
                  (let ((lst '()))
                    (loop for t = (car tokens)
                          while (and t (not (string= t ")"))) do
                            (push (parse-expr tokens) lst))
                    (pop tokens) ; remove ")"
                    (nreverse lst)))
                 (t
                  (or (parse-number token)
                      token)))))
           (parse-number (s)
             (handler-case
                 (parse-integer s)
               (error () nil))))
    (multiple-value-bind (expr _) (values (parse-expr tokens) tokens)
      expr)))

(defun eval-ast (ast it)
  (cond
    ((numberp ast) ast)
    ((stringp ast) (error "Unknown atom: ~A" ast))
    ((consp ast)
     (let* ((op (car ast))
            (args (cdr ast))
            (fn (gethash op (interpreter-env it))))
       (unless fn
         (error "Unknown operator: ~A" op))
       (apply fn (mapcar (lambda (x) (eval-ast x it)) args))))
    (t (error "Invalid AST: ~A" ast))))

(defun eval-expr (expr &optional (it (make-interpreter)))
  (let* ((tokens (tokenize expr))
         (ast (parse tokens)))
    (eval-ast ast it))
  )
