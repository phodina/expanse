(define-module (expanse packages vosk)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix gexp)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages machine-learning)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:))

(define-public vosk
  (package
    (name "vosk")
    (version "0.3.42")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/alphacep/vosk-api")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "0ikbybgp8iznyi9q8q7zpwb0mhn6yv3gja31rrid75p434lkx7f7"))))
    (build-system gnu-build-system)
	(arguments
	 (list #:phases
	   #~(modify-phases %standard-phases
	     (delete 'configure)
	     (add-after 'unpack 'enter-src
	      (lambda* _
		   (chdir "src")
		   (substitute* "Makefile"
		   (("KALDI_ROOT?=*.") (string-append #$kaldi  "/"))))))))
	(inputs (list kaldi))
    (home-page
     "https://github.com/oreboot/oreboot")
    (synopsis
     "Offline speech recognition API")
    (description "")
    (license license:asl2.0)))
