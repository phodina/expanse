(define-module (expanse packages eap)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages dns)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages networking)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:))

(define-public responder
  (package
    (name "responder")
    (version "3.1.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/lgandx/Responder")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "0kx5c39jzpw7ni7d1s3d0bjbjw75dwpapzcj86yr3ca5hffmwnl9"))))
    (build-system python-build-system)
	(arguments
	(list #:use-setuptools? #f
	  #:tests? #f
	  #:phases
	  #~(modify-phases %standard-phases
	  (replace 'install
	  (lambda* _
	   ;(copy-recursively "usr/share" (string-append #$output "/usr/share"))
	   ;(copy-recursively "usr/log" (string-append #$output "/usr/log"))
	   (copy-recursively #$source (string-append #$output "/bin"))
	   ))
	   ;(mkdir-p (string-append #$output "/bin"))
	   ;(symlink (string-append #$output "/bin/Responder.py") (string-append #$output "/bin/Responder.py"))))
	  (delete 'build))))
    (home-page
     "https://github.com/lgandx/Responder")
    (synopsis
     "Responder is an LLMNR, NBT-NS and MDNS poisoner")
    (description
     "")
    (license license:gpl3+)))

(define-public eaphammer
  (package
    (name "eaphammer")
    (version "1.13.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/s0lst1c3/eaphammer")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "17m6rkr92vlccr5crdcv6h1k40jfr1jkxrah6fhciiwxp7nz0sci"))))
    (build-system cmake-build-system)
	(arguments
	`(#:phases
	  (modify-phases %standard-phases
	   (add-before 'configure 'chdir-src
	   (chdir "neo")))))
	(inputs (list openssl hostapd hcxdumptool responder
	;apache2
	dnsmasq
	libnfnetlink
	libnl
	curl
	zlib
	libpcap
	python
python-gevent
python-tqdm
python-pem
python-pyopenssl
;scapy
python-lxml
python-beautifulsoup4
python-pyquery
;requests_html
;pywebcopy
python-jinja2
python-flask-cors
python-flask-socketio))
    (home-page
     "https://github.com/s0lst1c3/eaphammer")
    (synopsis
     "Evil twin attacks against WPA2-Enterprise networks")
    (description
     "")
    (license license:gpl3+)))
