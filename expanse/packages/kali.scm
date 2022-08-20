(define-module (expanse packages kali)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (gnu packages python)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:))

; TODO: uses module from the same package under framework dir
(define-public creddump7
  (package
    (name "creddump")
    (version "0.1")
    (home-page
     "https://github.com/CiscoCXSecurity/creddump7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page)
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "0847d479d6djssz8xhi8n9734xp3x0ihc1xkxbc7vr09sllaj24c"))))
    (build-system python-build-system)
	(arguments
	`(#:python ,python-2
	  #:tests? #f
	  #:use-setuptools? #f
      #:phases
	   (modify-phases %standard-phases
	    (delete 'build)
		(replace 'install
		 (lambda* (#:key outputs #:allow-other-keys)
		 (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
		 (mkdir-p bin)
		 (install-file "cachedump.py" bin)
		 (install-file "lsadump.py" bin)
		 (install-file "pwdump.py" bin)))))))
    (synopsis
     "Extracts credentials from Windows registry hives")
    (description
     "")
    (license license:gpl3+)))

(define-public minikatz
  (package
    (name "mimikatz")
    (version "2.2.0-20210810")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/gentilkiwi/mimikatz")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "0847d479d6djssz8xhi8n9734xp3x0ihc1xkxbc7vr09sllaj24c"))))
    (build-system gnu-build-system)
	(arguments
	`(#:python ,python-2
	  #:tests? #f
	  #:use-setuptools? #f
      #:phases
	   (modify-phases %standard-phases
	    (delete 'build)
		(replace 'install
		 (lambda* (#:key outputs #:allow-other-keys)
		 (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
		 (mkdir-p bin)
		 (install-file "cachedump.py" bin)
		 (install-file "lsadump.py" bin)
		 (install-file "pwdump.py" bin)))))))
    (home-page
     "https://github.com/CiscoCXSecurity/creddump7")
    (synopsis
     "Extracts credentials from Windows registry hives")
    (description
     "")
    (license license:gpl3+)))
