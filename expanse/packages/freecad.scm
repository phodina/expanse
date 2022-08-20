(define-module (expanse packages freecad)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (gnu packages engineering))

(define-public freecad-link
  (package
    (inherit freecad)
    (name "freecad-link")
    (version "2022.04.20")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/realthunder/FreeCAD")
	   (commit (string-append version "-edge"))))
       (sha256
        (base32
         "0rccjy0dflvdqwc12w3injknyf5g5rp0rmd04qlabskccbsk174i"))))
    (home-page
     "https://github.com/realthunder/FreeCAD")
    (synopsis
     "Link branch FreeCAD")))
