(define-module (expanse packages grabserial)
  #:use-module (guix packages)
  #:use-module (gnu packages python-xyz)
  #:use-module (guix git-download)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:))

(define-public grabserial
 (package
  (name "grabserial")
  (version "2.0.2")
  (source
  (origin
            (method git-fetch)
            (uri (git-reference
                   (url "https://github.com/tbird20d/grabserial")
                   (commit (string-append "v" version))))
            (file-name (git-file-name name version))
            (sha256
             (base32
              "0ryk4w8q6zfmia71nwnk5b7xaxw0sf45dw9q50xp7k76i3k5f9f3"))))
  (build-system python-build-system)
  (inputs (list python-pyserial))
  (synopsis "Dump serial communications with timestamps")
  (description "This package provides a tool to dump serial communication with
timestamp.")
  (home-page "https://github.com/tbird20d/grabserial")
  (license license:gpl2+)))
