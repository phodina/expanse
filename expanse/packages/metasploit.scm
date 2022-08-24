(define-module (expanse packages metasploit)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (gnu packages gl)
  #:use-module (guix git-download)
  #:use-module (guix build-system ruby)
  #:use-module ((guix licenses) #:prefix license:))

(define-public metasploit
  (package
    (name "metasploit")
    (version "6.1.40")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/rapid7/metasploit-framework")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0wi3nc6y36qqg44bixbgzbg5dvxsl7fnbr99v8fdh044av63196x"))))
    (build-system ruby-build-system)
    (home-page "https://github.com/rapid7/metasploit-framework")
    (arguments
     `(#:tests? #f))
    (synopsis "Metasploit Framework ")
    (description "")
	; Multiple
    (license #f)))
