(define-module (expanse packages cc-tool)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages libusb)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:))

(define-public cc-tool
(package
  (name "cc-tool")
  (version "0.27")
  (source (origin
            (method git-fetch)
            (uri (git-reference
             (url "https://github.com/dashesy/cc-tool")
             (commit (string-append "v" version))))
            (file-name (git-file-name name version))
            (sha256
             (base32
              "1bnyp3fxhzhz6in4yx8s6vh004gslykrpysdz6b8x8b96ha35c7c"))))
  (build-system gnu-build-system)
  (native-inputs (list autoconf automake libtool pkg-config))
  (arguments
  `(#:phases
    (modify-phases %standard-phases
	 (add-after 'install 'install-udev
	  (lambda* (#:key outputs #:allow-other-keys)
	   (let* ((udev (string-append (assoc-ref outputs "out")
	   "/lib/udev/rules.d")))
	   (mkdir-p udev)
	   (install-file "udev/90-cc-debugger.rules" udev)))))))
  (inputs (list libusb boost))
  (synopsis "Texas Instrument CC Debugger")
  (description "")
  (home-page "http://sourceforge.net/projects/cctool/")
  (license license:gpl2)))

(define-public flash-cc2531
(let ((commit "005054e5ff062128591e2a68b9977ab38856e807")
      (revision "1"))
(package
  (name "flash-cc2531")
  (version "")
  (source (origin
            (method git-fetch)
            (uri (git-reference
             (url "https://github.com/jmichault/flash_cc2531")
             (commit commit)))
            (file-name (git-file-name name version))
            (sha256
             (base32
              "1365ssxgbpfz14zl5mk0km867hrdv8yr69p6k7qwyppgx4i934v6"))))
  (build-system gnu-build-system)
  (native-inputs (list autoconf automake libtool pkg-config))
  (arguments
  `(#:make-flags (list (string-append "CC=" ,(cc-for-target)))
    #:phases
    (modify-phases %standard-phases
	 (delete 'configure))))
  (synopsis "Flash CC2531 USB dongle from Raspberry")
  (description "")
  (home-page "https://jmichault.github.io/flash_cc2531-dok/en/")
  (license license:gpl3))))

(define-public wiringpi
(package
  (name "wiringpi")
  (version "2.61-1")
  (source (origin
            (method git-fetch)
            (uri (git-reference
             (url "https://github.com/WiringPi/WiringPi")
             (commit version)))
            (file-name (git-file-name name version))
            (sha256
             (base32
              "1bnyp3fxhzhz6in2yx8s6vh004gslykrpysdz6b8x8b96ha35c7c"))))
  (build-system gnu-build-system)
  (native-inputs (list autoconf automake libtool pkg-config))
  (arguments
  `(#:phases
    (modify-phases %standard-phases
	 (add-after 'install 'install-udev
	  (lambda* (#:key outputs #:allow-other-keys)
	   (let* ((udev (string-append (assoc-ref outputs "out")
	   "/lib/udev/rules.d")))
	   (mkdir-p udev)
	   (install-file "udev/90-cc-debugger.rules" udev)))))))
  (inputs (list libusb boost))
  (synopsis "Gordon's Arduino wiring-like WiringPi Library for the Raspberry Pi")
  (description "")
  (home-page "")
  (license license:lgpl3)))
