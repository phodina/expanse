(define-module (expanse packages thunderbolt)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages python-xyz)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:))

(define-public spycheck
(let ((commit "c33160beffdf202f3d543052377b83a048486464")
      (revision "1"))
  (package
    (name "spycheck")
    (version "")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/BjornRuytenberg/spycheck-linux")
	   (commit commit)))
       (sha256
        (base32
         "0yhyjjkx4klci6qpdb895y7hwdrwc4zz645wm4i9zmfc2m718sz6"))))
    (build-system python-build-system)
	(arguments
	(list #:tests? #f
	      #:use-setuptools? #f
          #:phases
          #~(modify-phases %standard-phases
		  (delete 'build)
		  (replace 'install
		  (lambda* _
		  (install-file "spycheck.py" (string-append #$output "/bin")))))))
    (home-page
     "https://thunderspy.io/")
    (synopsis
     "Check if system is vulnerable to the Thunderspy attacks")
    (description
     "")
    (license license:gpl3+))))

(define-public tcfp
(let ((commit "9d6d9327b5d7367d8962aab10a5d5797f7241105")
      (revision "1"))
  (package
    (name "tcfp")
    (version "")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/BjornRuytenberg/tcfp")
	   (commit commit)))
       (sha256
        (base32
          "0hmyk2iiw33anad9x53bbs43zm11akn9dl4xw404ii9mycwpy99q"))))
    (build-system python-build-system)
	(arguments
	(list #:tests? #f
	      #:use-setuptools? #f
          #:phases
          #~(modify-phases %standard-phases
		  (delete 'build)
		  (replace 'install
		  (lambda* _
		  (install-file "tcfp.py" (string-append #$output "/bin")))))))
    (home-page
     "https://thunderspy.io/")
    (synopsis
     "Thunderbolt Controller Firmware Patcher")
    (description
     "")
    (license license:gpl3+))))

(define-public inception
  (package
    (name "inception")
    (version "0.4.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/carmaa/inception")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "1mkdrfcq8afd8mrhbprdfkg1x48ph8racvp56dq3jnll1hb8xav8"))))
    (build-system python-build-system)
	(arguments
	(list #:tests? #f
          #:phases
          #~(modify-phases %standard-phases
		  (delete 'validate-runpath))))
;		  (replace 'install
;		  (lambda* _
;		  (install-file "spycheck.py" (string-append #$output "/bin")))))))
    (inputs (list python-pyusb python-msgpack-python))
    (home-page
     "https://github.com/carmaa/inception")
    (synopsis
     "Inception is a physical memory manipulation and hacking tool exploiting
 PCI-based DMA ")
    (description
     "")
    (license license:gpl3+)))
