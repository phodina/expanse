(define-module (expanse packages camera)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages python-xyz)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:))

(define-public cameractrls
  (package
    (name "cameractrls")
    (version "0.3.1")
    (home-page "https://github.com/soyersoyer/cameractrls")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page)
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "0z1sbd00zgazbl8s3gb0y032hm6wrrs3hf8jmh07ggwybb60dvav"))))
    (build-system python-build-system)
    (synopsis "Camera controls")
    (description
     "")
    (license license:expat)))
