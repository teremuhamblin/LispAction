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
├── test.asd
├── ROADMAP.md
├── CHANGELOG.md 
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

### 🔓 License
- The Unlicense `markdown`
```md
Ce projet est placé dans le domaine public via The Unlicense.

Vous êtes libre de copier, modifier, publier, utiliser, compiler, vendre ou distribuer
ce logiciel, pour n’importe quel usage, sans aucune restriction.

LE LOGICIEL EST FOURNI "TEL QUEL", SANS AUCUNE GARANTIE, EXPRESSE OU IMPLICITE,
Y COMPRIS LES GARANTIES DE QUALITÉ MARCHANDE, D’ADÉQUATION À UN USAGE PARTICULIER
ET D’ABSENCE DE CONTREFAÇON.
```

```text
Pour plus d’informations : https://unlicense.org
```
