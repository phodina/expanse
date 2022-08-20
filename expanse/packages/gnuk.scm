(define-module (expanse packages gnuk)
  #:use-module (gnu packages)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages python-crypto)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:))

(define-public gnuk-extractor
(let ((commit "5a075966faf1298eac9827387cfea3eb3f49dfa1")
      (revision "1"))
  (package
    (name "gnuk-extractor")
    (version "")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/rot42/gnuk-extractor")
	   (commit commit)))
       (sha256
        (base32
         "1zna80v83kdlij7ang79dcfyw9gwpvp7dswaljyn505xjphkimcp"))))
    (build-system python-build-system)
	(arguments
	(list #:phases
	#~(modify-phases %standard-phases
	(add-after 'unpack 'fix-version
	(lambda* _
	(substitute* "setup.py"
	(("0.5.2") #$(package-version python-pgpy))))))))
	(inputs (list python-pgpy))
    (home-page
     "https://github.com/smeggingsmegger/VeryPrettyTable")
    (synopsis
     "Extract PGP secret keys from Gnuk/Nitrokey firmware")
    (description
     "VeryPrettyTable is a Python library for displaying tabular data in a
database cursor such as @code{sqlite3}.")
    (license license:agpl3))))
