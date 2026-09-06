(asdf:defsystem "lispaction"
  :description "Mini interpréteur Lisp."
  :author "teremuhamblin"
  :license "The Unlicense"
  :version "0.1.0"

  ;; Dépendances externes (si besoin plus tard)
  :depends-on ()

  ;; Organisation propre des fichiers
  :serial t
  :components
  ((:module "src"
    :components
    ((:module "lispaction"
      :components
      ((:file "package")
       (:file "core")))))

   (:module "tests"
    :components
    ((:file "test-core"))))

  ;; Définition du système de test
  :in-order-to ((test-op (load-op "lispaction-tests"))))
