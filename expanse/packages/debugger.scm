(define-module (expanse packages debugger)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages crates-io)
  #:use-module (guix build-system cargo)
  #:use-module ((guix licenses) #:prefix license:))

(define-public tezedge-debugger
  (package
    (name "tezedge-debugger")
    (version "1.6.9")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/tezedge/tezedge-debugger")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "1gfbi58jj9p58sljfvpaficwzvn6j564a98ccb17jzrbgp49r7va"))))
    (build-system cargo-build-system)
    (home-page
     "https://github.com/tezedge/tezedge-debugger")
    (synopsis
     "Debugger")
    (description
     "")
    (license license:expat)))
