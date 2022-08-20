(define-module (expanse packages security)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix gexp)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages base)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages python)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages web)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages time)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:))

(define-public python-polyswarm-api
  (package
    (name "python-polyswarm-api")
    (version "2.10.0")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "polyswarm-api" version))
        (sha256
          (base32 "0gvdyxcvaz5l5h6im6nkqz2qgmik9nbcg8368m3h5l4krj1iybi4"))))
    (build-system python-build-system)
    (propagated-inputs
      (list python-dateutil python-enum34 python-future python-requests))
    (home-page "https://github.com/polyswarm/polyswarm-api")
    (synopsis
      "Client library to simplify interacting with the PolySwarm consumer API")
    (description
      "Client library to simplify interacting with the PolySwarm consumer API")
    (license license:expat)))

(define-public malwoverview
  (package
    (name "malwoverview")
    (version "5.0.2")
    (home-page "https://github.com/alexandreborges/malwoverview")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page)
	   (commit (string-append "v." version))))
       (sha256
        (base32
         "0vf30iaxvqw5xzkzfx7vv31r2l5vl30l5c0mfifvpxsqx2ly9sg5"))))
    (build-system python-build-system)
	(arguments
	(list #:phases
	#~(modify-phases %standard-phases
	   (add-after 'unpack 'fix-data-files-location
	   (lambda* _
	    (substitute* "setup.py"
		 (("data_files.*") "")))))))
	(native-inputs (list python-configparser python-pathlib python-polyswarm-api))
    (synopsis
     "Response tool used for thread hunting")
    (description
     "")
    (license license:gpl3+)))

(define-public chipsec
  (package
    (name "chipsec")
    (version "1.8.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/chipsec/chipsec")
	   (commit version)))
       (sha256
        (base32
         "19xv368d6cs0iacm4mw4nbhj1ris98cs5qyrndzp5rplbqad2c7k"))))
    (build-system python-build-system)
	(native-inputs (list gnu-make))
    (home-page
     "https://github.com/chipsec/chipsec/blob/main/chipsec-manual.pdf")
    (synopsis
     "Platform Security Assessment Framework")
    (description
     "")
    (license license:gpl2+)))

(define-public medusa
(let ((commit "bdaa2dda92ad3681387a60cc41d3bd9f077360a1")
      (revision "1"))
  (package
    (name "medusa")
    (version "2.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/jmk-foofus/medusa")
	   (commit commit)))
       (sha256
        (base32
         "1l90p4h5y1qqr2j2qwwr40k38sp79jrbffnl9m3ca2p1qd3mnn12"))))
    (build-system gnu-build-system)
	(native-inputs (list pkg-config))
	(inputs (list openssl))
    (home-page
     "http://foofus.net/goons/jmk/medusa/medusa.html")
    (synopsis
     "Medusa Parallel Network Login Auditor")
    (description
     "@code{Medusa} is a speedy, parallel, and modular, login brute-forcer. The goal is
	 to support as many services which allow remote authentication as
	 possible.")
    (license license:gpl2+))))

(define-public ncrack
  (package
    (name "ncrack")
    (version "0.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/nmap/ncrack")
	   (commit version)))
       (sha256
        (base32
         "1gnv5xdd7n04glcpy7q1mkb6f8gdhdrhlrh8z6k4g2pjdhxlz26g"))))
    (build-system gnu-build-system)
	(inputs (list openssh openssl zlib))
    (home-page
     "https://nmap.org/ncrack/man.html")
    (synopsis
     "Network authentication cracking tool")
    (description
     "@code{Ncrack} is a tool for network authentication cracking. It was designed for high-speed parallel cracking using a dynamic engine that can adapt to different network situations")
    (license license:gpl2+)))

(define-public python-pyrit
  (package
    (name "python-pyrit")
    (version "0.5.0")
    (home-page "https://github.com/JPaulMora/Pyrit")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page)
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "0mrmxjbzqw0pbyi7kn56a76b1065bdff0nz6bj3wy4q3nln3g4fi"))))
	(inputs (list libpcap openssl zlib))
    (build-system python-build-system)
	(arguments
	(list #:python python-2
#:phases
#~(modify-phases %standard-phases
	(add-before 'sanity-check 'home-dir
	(lambda* _
	(setenv "HOME" "/tmp"))))))
    (synopsis "The famous WPA precomputed cracker")
    (description
     "Pyrit allows you to create massive databases of pre-computed
WPA/WPA2-PSK authentication phase in a space-time-tradeoff.")
    (license license:gpl3+)))

(define-public hcxtools-ng
  (package
    (name "hcxtools")
    (version "6.2.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/ZerBea/hcxtools")
	   (commit version)))
       (sha256
        (base32
         "0460dxbc04w60l3g06rk007yyb6qprgyii59y2zdki0vy7q63m8b"))))
    (build-system gnu-build-system)
    (inputs
     (list curl libpcap openssl zlib))
    (arguments
     (list #:make-flags
       #~(list (string-append "CC=" #$(cc-for-target))
	   "LDFLAGS+=-lcrypto" "LDFLAGS+=-lcurl" "LDFLAGS+=-lz"
	   ;,(string-append "LDFLAGS+=" (list "-lcrypto" "-lcurl" "-lz"))
             (string-append "PREFIX=" #$output))
       #:tests? #f                      ; no test suite
       #:phases
       #~(modify-phases %standard-phases
         (delete 'configure))))
    (home-page "https://github.com/ZerBea/hcxtools")
    (synopsis "Capture wlan traffic to hashcat and John the Ripper")
    (description
     "This package contains a small set of tools to capture and convert
packets from wireless devices for use with hashcat or John the Ripper.")
    (license license:expat)))

(define-public wifite2
  (package
    (name "wifite2")
    (version "2.6.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/kimocoder/wifite2")
	   (commit version)))
       (sha256
        (base32
         "087d6qli2cl4gnb4g37ackwdgsgh5c0z29jvc0nq08ijx04q9imb"))))
    (build-system python-build-system)
	(arguments
	(list 
#:tests? #f ; Python module pyrit avilable only for Python2
	#:phases
	#~(modify-phases %standard-phases
	   (add-after 'unpack 'fix-install-location
	   (lambda* _
	    (substitute* "wifite/tools/reaver.py"
		(("'reaver'") (string-append "'" #$reaver
		"/bin/reaver'")))
	    (substitute* "wifite/tools/hashcat.py"
		(("'hcxdumptool'") (string-append "'" #$hcxdumptool
		"/bin/hcxdumptool'")))
	    (substitute* "wifite/tools/hashcat.py"
		(("'hcxpcapngtool'") (string-append "'" #$hcxtools-ng
		"/bin/hcxpcapngtool'")))
	    (substitute* "wifite/util/scanner.py"
		(("'clear'") (string-append "'" #$ncurses "/bin/clear'")))
	    (substitute* "wifite/tools/tshark.py"
		(("'tshark'") (string-append "'" #$wireshark "/bin/tshark'")))
	    (substitute* "wifite/tools/airodump.py"
		(("'airodump-ng'") (string-append "'" #$aircrack-ng
		"/sbin/airodump-ng'")))
	    (substitute* "wifite/tools/airmon.py"
		(("'airmon-ng'") (string-append "'" #$aircrack-ng "/sbin/airmon-ng'")))
	    (substitute* "setup.cfg"
		 (("/usr") #$output)))))))
	(native-inputs (list which)) ;python-flake8))
	(inputs (list aircrack-ng hcxtools-ng hcxdumptool python-pyrit reaver wireshark iproute iw 
	ncurses)) ; clear command
    (home-page
     "")
    (synopsis
     "")
    (description
     "@code{Ncrack} is a tool for network authentication cracking. It was designed for high-speed parallel cracking using a dynamic engine that can adapt to different network situations")
    (license license:gpl2+)))

(define-public kismet
  (package
    (name "kismet")
    (version "2022-02")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/kismetwireless/kismet")
	   (commit (string-append "kismet-" version "-R1"))))
       (sha256
        (base32
         "01q86hrgpai433sc65dlnqy91qd26w5dwyp37adszqxfb6d2an1r"))))
    (build-system gnu-build-system)
    (arguments
     (list 
       #:tests? #f                      ; no test suite
       #:phases
       #~(modify-phases %standard-phases
         (add-after 'unpack 'fix-install
		 (lambda* _
		 (substitute* "Makefile.in"
		 (("-o \\$\\(INSTUSR\\) -g \\$\\(SUIDGROUP\\)") "")
		 (("-o \\$\\(INSTUSR\\) -g \\$\\(INSTGRP\\)") "")))))))
    (home-page "https://www.kismetwireless.net/")
	(native-inputs (list pkg-config python python-2 perl))
	(inputs (list openssl libpcap libusb protobuf protobuf-c libwebsockets sqlite zlib))
    (synopsis "Wireless network and device detector")
    (description
     "This package provides a wireless network and device detector, sniffer,
wardriving tool, and WIDS (wireless intrusion detection) framework.  Kismet
works with Wi-Fi interfaces, Bluetooth interfaces, some SDR
(software defined radio) hardware like the RTLSDR, and other specialized
capture hardware")
    (license license:gpl2+)))

; TODO: Hydra, somewhere already packaged
; https://salsa.debian.org/pkg-security-team/hydra

; TODO: Security channel
; https://github.com/aartaka/chur-guix/blob/master/chur/exploit.scm
