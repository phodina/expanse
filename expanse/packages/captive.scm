(define-module (expanse packages captive)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages gnunet)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:))

(define-public nodogsplash
  (package
    (name "nodogsplash")
    (version "5.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/nodogsplash/nodogsplash")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "03xbxvlr04cw7v6i3j8jk8258qrfvv4wn7c5r892zkiq48mg8yl6"))))
    (build-system gnu-build-system)
	(arguments
	(list #:tests? #f
	#:make-flags #~(list (string-append "CC=" #$(cc-for-target)))
	#:phases
	 #~(modify-phases %standard-phases
	  (delete 'configure))))
	(inputs (list libmicrohttpd))
    (home-page
     "https://github.com/nodogsplash/nodogsplash")
    (synopsis
     "Captive portal to restrict internet access to Internet")
    (description
     "")
    (license license:gpl2+)))

(define-public wifidog-gateway
  (package
    (name "wifidog-gateway")
    (version "1.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/wifidog/wifidog-gateway")
	   (commit version)))
       (sha256
        (base32
         "0cbhk93zrnjnf0hxfhxnxwa7v6gpys1fsi1fl57mmhb1095hz68g"))))
    (build-system gnu-build-system)
	(native-inputs (list autoconf automake libtool))
    (home-page
     "https://github.com/wifidog/wifidog-gateway")
    (synopsis
     "Captive portal for embedded systems")
    (description "")
    (license license:gpl2+)))
