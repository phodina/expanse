(define-module (expanse packages asar)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (guix build-system node)
  #:use-module ((guix licenses) #:prefix license:))

(define-public node-asar
  (package
    (name "node-asar")
    (version "3.2.0")
    (home-page "https://github.com/electron/asar")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page)
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "1j9iz5y731yc4dm9hm8hg0xwshy1mk0qy5akvnx5lkyqbrz80ac9"))))
    (build-system node-build-system)
    (synopsis
     "tar-like archive format with indexing")
    (description
     "")
    (license license:expat)))
