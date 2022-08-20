(define-module (expanse packages museum)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system python)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages engineering)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages music)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module ((guix licenses) #:prefix license:))


(define-public terminal-museum
(let ((commit "cc8596eff0a4ae8423f395f324c95f72a9efbdec")
      (revision "1"))
  (package
    (name "terminal-museum")
    (version "")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/EdinCitaku/TerminalMuseum")
	   (commit commit)))
       (sha256
        (base32
         "1i0vbipv6lv6yylamz9b43bqzw050r72qigi2sg45x5vzzlixckv"))))
	(build-system python-build-system)
    (home-page
     "https://github.com/EdinCitaku/TerminalMuseum")
    (synopsis
     "Displays a new piece of classical art on your terminal")
	(description "")
	(license license:asl2.0))))
