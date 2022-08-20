(define-module (expanse packages valetudo)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (guix build-system node)
  #:use-module ((guix licenses) #:prefix license:))

(define-public valetudo
  (package
    (name "valetudo")
    (version "2022.02.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/Hypfer/Valetudo")
	   (commit version)))
       (sha256
        (base32
         "0qds0721bxb5zbzajrgs3lwkfvc36dh3way2zk98s7q0dz0clpqs"))))
    (build-system node-build-system)
	(inputs (list typescript-eslint))
    (home-page
     "https://valetudo.cloud/")
    (synopsis
     "Cloud-free control webinterface for vacuum robots")
    (description
     "This package is a cloud replacement for vacuum robots enabling local-only
operation.")
    (license license:asl2.0)))

(define-public typescript-eslint
  (package
    (name "typescript-eslint")
    (version "5.12.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/typescript-eslint/typescript-eslint")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "15gq55h8m93mjz4x8gh79r5wvaabx6r25jl6rgs00n6m3315g3yp"))))
    (build-system node-build-system)
	(inputs (list node-babel))
    (home-page
     "https://typescript-eslint.io/")
    (synopsis
     "ESLint support for Typescript")
    (description
     "This package is a ")
    (license #f)))

(define-public node-babel
  (package
    (name "node-babel")
    (version "7.17.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/babel/babel")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "0kqj74zzc9sq7v6ag21d24wcsqn7lcz1g7r76lhv7xf22lpmq7f5"))))
    (build-system node-build-system)
    (home-page
     "https://babel.dev/")
    (synopsis
     "Compiler for writing next generation JavaScript")
    (description
     "This package is a ")
    (license license:expat)))
