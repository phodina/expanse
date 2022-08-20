(define-module (expanse packages depthcharge)
  #:use-module (gnu packages)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:))

(define-public depthcharge
  (package
    (name "depthcharge")
    (version "0.3.2")
    (home-page "https://github.com/nccgroup/depthcharge")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page)
	   (commit version)))
       (sha256
        (base32
         "12gmv2y55h1an0rnbq0ckv238lj56jy3a9ydikllrrlb3lmlc30g"))))
    (build-system python-build-system)
	(arguments
	(list #:phases
	 #~(modify-phases %standard-phases
	    (add-after 'unpack 'chdir
		 (lambda _
		  (chdir "python"))))))
	(inputs (list python-tqdm python-pyserial))
    (synopsis
     "U-Boot hacking toolkit")
    (description
     "")
    (license license:bsd-3)))
