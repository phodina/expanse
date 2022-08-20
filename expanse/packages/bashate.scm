(define-module (expanse packages bashate)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (gnu packages check)
  #:use-module (gnu packages openstack)
  #:use-module (gnu packages python-check)
  #:use-module (gnu packages python-xyz)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:))

(define-public python-bashate
  (package
    (name "python-bashate")
    (version "2.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "bashate" version))
        (sha256
          (base32 "1j136pzfrcszbk2zzzislkqdcwm3wh3nkaprdkxw4pbi74v19px0"))))
    (build-system python-build-system)
	(arguments
	`(#:phases
	  (modify-phases %standard-phases
	   (add-after 'unpack 'fix-test-requirements
	    (lambda* _
		 (substitute* "test-requirements.txt"
		 (("hacking.*") "hacking\n"))))
	   (add-before 'check 'setup-python-modules
	   (lambda* _
	    (setenv "GUIX_PYTHONPATH" (string-append (getcwd) "/build/lib:"
		(getenv "GUIX_PYTHONPATH"))))))))
	(native-inputs (list python-coverage python-discover python-fixtures python-hacking
	python-stestr python-subunit python-testtools))
    (propagated-inputs (list python-pbr))
    (home-page "https://docs.openstack.org/bashate/latest/")
    (synopsis "A pep8 equivalent for bash scripts")
    (description "This package provides a pep8 equivalent for bash scripts")
    (license license:asl2.0)))
