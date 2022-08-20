(define-module (expanse packages rasa)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages python-xyz)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:))

(define-public rasa
  (package
    (name "rasa")
    (version "3.0.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/RasaHQ/rasa")
	   (commit version)))
       (sha256
        (base32
         "0cj7mfc92496lkkm5rj6540z6dx1dp3jvrz1zhsw1bq8kh9qzc5f"))))
    (build-system python-build-system)
;    (propagated-inputs
;     `(("python-colorama" ,python-colorama)
;       ("python-termcolor" ,python-termcolor)))
    (home-page
     "https://rasa.com/docs/")
    (synopsis
     "Machine learning to automate text and voice based conversations")
    (description
     "")
    (license license:asl2.0)))
