(asdf:defsystem "lispaction"
  :description "Mini interpréteur Lisp."
  :author "teremuhamblin"
  :license "The Unlicense"
  :version "1.0.0"
  :serial t
  :components ((:file "src/lispaction/package")
               (:file "src/lispaction/core")
               (:file "tests/test-core")))
