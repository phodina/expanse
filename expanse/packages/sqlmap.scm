(define-module (expanse packages sqlmap)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages python-xyz)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:))

(define-public sqlmap
  (package
    (name "sqlmap")
    (version "1.6.4")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "sqlmap" version))
        (sha256
          (base32 "07sph6c4vaafcvhxfnrs4qkvajb360raspq7baky95qqmzjqj4p9"))))
    (build-system python-build-system)
	(arguments
	(list #:tests? #f))
    (home-page "https://sqlmap.org")
    (synopsis "Automatic SQL injection and database takeover tool")
    (description "Automatic SQL injection and database takeover tool")
    (license license:gpl2+)))
