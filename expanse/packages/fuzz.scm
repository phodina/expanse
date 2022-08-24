(define-module (expanse packages fuzz)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:))

(define-public wtf
  (package
    (name "wtf")
    (version "0.3.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/0vercl0k/wtf")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "1zsam110ps3rc4pq814lbk40nq5bm9qm4abgbf4j1pvz975fr0g6"))))
    (build-system cmake-build-system)
    (home-page
     "https://github.com/0vercl0k/wtf")
    (synopsis
     "Distributed code-coverage guided snapshot based fuzzer")
    (description
     "")
    (license license:expat)))
