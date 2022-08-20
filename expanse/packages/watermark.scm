(define-module (expanse packages watermark)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gnunet)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:))

(define-public gtk-layer-shell-0.7
 (package
 (inherit gtk-layer-shell)
 (name "gtk-layer-shell")
 (version "0.7.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/wmww/gtk-layer-shell")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1iw864cwlks4immrh4rqvijx2i98hlp422g77466m9apkh35cbfi"))))))

(define-public activate-linux
  (package
    (name "activate-linux")
    (version "0.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/MrGlockenspiel/activate-linux")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "0klzm8063vyay5m06c9zabfhzadgzkkv377rxhl838d60grndfrj"))))
    (build-system gnu-build-system)
	(arguments
	(list 
    #:tests? #f
	#:phases
	 #~(modify-phases %standard-phases
	    (delete 'configure)
		(add-after 'unpack 'fix-cairo-include
		(lambda* _
		(invoke "ls")
		(substitute* "Makefile"
		(("/usr/local/bin/") (string-append #$output "/bin"))
		(("-I/usr/include/cairo") (string-append "-I" #$cairo "/include/cairo")))))
	(add-before 'install 'create-dir
	(lambda* _
	(mkdir-p (string-append #$output "/bin")))))))
	(native-inputs (list clang pkg-config))
	(inputs (list cairo libx11 libxext libxfixes libxinerama))
    (home-page
     "https://github.com/MrGlockenspiel/activate-linux")
    (synopsis
     "Activate Windows watermark ported to Linux")
    (description
     "")
    (license license:gpl2+)))

(define-public activate-linux-wayland
(let ((commit "f6a9923c6c51e044b746b1d0c2c226fb4278c3c4")
      (revision "1"))
  (package
    (name "activate-linux-wayland")
    (version (git-version "0.1-pre" revision commit))
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/Kljunas2/activate-linux")
	   (commit commit)))
       (sha256
        (base32
         "0nil47429rsfi96mzyy6dsxybk6xkjf0l22cgi1wp8dxli035hvm"))))
    (build-system gnu-build-system)
	(arguments
	(list 
    #:tests? #f
	#:phases
	 #~(modify-phases %standard-phases
	    (delete 'configure)
		(replace 'install
		(lambda* _
		(install-file "bin/activate-linux" (string-append #$output
		"/bin")))))))
	(native-inputs (list pkg-config))
	(inputs (list gtk+ gtk-layer-shell-0.7))
    (home-page
     "https://github.com/Kljunas2/activate-linux")
    (synopsis
     "Activate Linux watermark for Wayland")
    (description "")
    (license license:expat))))
