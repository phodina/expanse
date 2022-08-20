(define-module (expanse packages tree)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:))

(define-public termbox2
(let ((commit "00c017b261de809400a789ebadccda3059bdecbc")
      (revision "1"))
  (package
    (name "termbox2")
    (version "")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/termbox/termbox2" )
	   (commit commit)))
       (sha256
        (base32
         "0yiz2li15xjvv8hjjzb9l3ylhccm7848zq2f9qvpn7wdy9l9mms2"))))
    (build-system gnu-build-system)
	(arguments
	`(#:make-flags (list (string-append "CC=" ,(cc-for-target)))
	  #:phases
	  (modify-phases %standard-phases
	   (delete 'configure)
       (replace 'check
         (lambda* (#:key tests? #:allow-other-keys)
           (when tests?
		     (chdir "tests")
			 (system "Xvfb :1 &")
             (setenv "DISPLAY" ":1")
			 ;(substitute* "run.sh"
			 ;(("check_deps\n") ""))
             (invoke "./run.sh")))))))
	(native-inputs (list xorg-server-for-tests xterm))
    (home-page
     "https://github.com/termbox/termbox2")
    (synopsis
     "Suckless terminal rendering library")
    (description
     "")
    (license license:expat))))

(define-public xvkbd
  (package
    (name "xvkbd")
    (version "4.1-1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://gitlab.apertis.org/pkg/xvkbd" )
	   (commit (string-append "apertis/" version "apertis0"))))
       (sha256
        (base32
         "1xl4z95xw0dx1s702mqpgzf942fc0r700d3yjnp9b2h685w7q44f"))))
    (build-system gnu-build-system)
	(arguments
     `(#:configure-flags
       (list "--disable-static"
             (string-append "--mandir="
                            (assoc-ref %outputs "out")
                            "/share/man")
	"out")))
      (native-inputs
       (list pkg-config autoconf automake libtool libxaw libxtst))
    (home-page
     "https://gitlab.apertis.org/pkg/xvkbd")
    (synopsis
     "Virtual keyboard for X window system")
    (description
     "")
    (license license:gpl2+)))

(define-public ictree
  (package
    (name "ictree")
    (version "1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/NikitaIvanovV/ictree" )
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "1cvzhswaf6wl6dsfxsd77c26kl25fxsy8l6cp4l95c5ji8dkgq4g"))))
    (build-system gnu-build-system)
	(arguments
	`(#:make-flags (list (string-append "CC=" ,(cc-for-target)))
	  #:phases
	  (modify-phases %standard-phases
	   (delete 'configure))))
    (home-page
     "https://github.com/NikitaIvanovV/ictree")
    (synopsis
     "Visually appealing ASCII table output format for Python")
    (description
     "")
    (license license:gpl3+)))
