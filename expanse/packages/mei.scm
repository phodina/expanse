(define-module (expanse packages mei)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:))

(define-public mei-amt-check
(let ((commit "ec921d1e0a2ac770e7835589a28b85bc2f15200c")
      (revision "1"))
  (package
    (name "mei-amt-check")
    (version (git-version "0.1-pre" revision commit))
    (home-page "https://github.com/mjg59/mei-amt-check")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page)
	   (commit commit)))
       (sha256
        (base32
         "17an8qgr8ci1chy12myk1ff21w08vz8n7gn0lk8h6w6hc9k45kag"))))
    (build-system gnu-build-system)
	(arguments
	(list 
    #:tests? #f
	#:phases
	 #~(modify-phases %standard-phases
	    (delete 'configure)
		(replace 'install
		(lambda* _
		 (install-file "mei-amt-check" (string-append #$output
		 "/bin")))))))
    (synopsis "Check whether AMT is enabled and provisioned")
    (description "This package provides a simple tool that tells you whether
AMT is enabled and provisioned. The detection relies on the mei_me driver.")
    (license license:gpl2+))))
