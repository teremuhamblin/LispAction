###### README.md >> markdown 
# 📄 LispAction
>Interpréteur ***Lisp Common***
- pensé pour la simplicité et la clarté.

### Structure de base du projet
📦 Architecture 
```text
LispAction/
├── src/
│   └── lispaction/
│       ├── package.lisp
│       └── core.lisp
├── tests/
│   └── test-core.lisp
├── lispaction.asd
├── README.md
├── LICENSE
└── .github/
    └── workflows/
        └── ci.yml
```

### Installation / Utilisation
   #### 1. Charger le système avec ***ASDF*** :
```lisp
(asdf:load-system "lispaction")
```

   #### 2. Exemple :
```lisp
(let ((it (lispaction:make-interpreter)))
  (lispaction:eval-expr "(+ 1 2 3)" it)) ; => 6
```

### Tests
```lisp
(asdf:load-system "lispaction")
(lispaction:run-tests)
```
