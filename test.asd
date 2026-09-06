(asdf:defsystem "lispaction-tests"
  :depends-on ("lispaction")
  :components
  ((:module "tests"
    :components
    ((:file "test-core"))))

  :perform (test-op (op c)
    (uiop:symbol-call :lispaction-tests :run-tests)))
