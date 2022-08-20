(define-module (expanse packages k40)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages xml)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:))

(define-public whisperer
  (package
    (name "whisperer")
    (version "0.60")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.scorchworks.com/K40whisperer/K40_Whisperer-0.60_src.zip")
       (file-name (git-file-name name version))
       (sha256
        (base32 "1nm1bcgjcm3b32742xdjkdavl19j5l9a9a3x7mwp6zz2qvqy613m"))))
    (build-system python-build-system)
    (arguments
     `(#:use-setuptools? #f
	   #:tests? #f
	   #:phases
	   (modify-phases %standard-phases
	    (replace 'unpack
		 (lambda* (#:key build-inputs #:allow-other-keys)
		  (let ((src (assoc-ref %build-inputs "source")))
		  (invoke "unzip" src "-d" "whisperer")
		  (chdir "whisperer"))))
		(delete 'build)
		(replace 'install
		(lambda* (#:key outputs #:allow-other-keys)
		 (copy-recursively "." (assoc-ref outputs "out")))))))
    (native-inputs (list unzip))
	(inputs (list python-lxml python-pyusb python-pillow python-pyclipper))
    (home-page "https://www.scorchworks.com/K40whisperer/k40whisperer.html")
    (synopsis "Control software for the stock K40 Laser controller")
    (description "")
    (license license:gpl3+)))
