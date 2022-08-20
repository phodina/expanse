(define-module (expanse packages moonlight)
  #:use-module (guix packages)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xiph)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system qt)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:))

(define-public moonlight
(package
  (name "moonlight")
  (version "3.1.4")
  (source (origin
            (method git-fetch)
            (uri (git-reference
             (url "https://github.com/moonlight-stream/moonlight-qt")
             (commit (string-append "v" version))))
            (file-name (git-file-name name version))
            (sha256
             (base32
              "02y2rbiiawhj1dvgxdaz8k9kpz6zkv20zsk17fbqj8259m3g5xr5"))))
  (build-system qt-build-system)
  (arguments
   `(#:tests? #f
     #:make-flags ,#~(list (string-append "-I" #$(this-package-input
	 "h264bitstream") "/include/h264bitstream"))
    #:phases
	   (modify-phases %standard-phases
	    (replace 'configure
		 (lambda* _
		  (substitute* "moonlight-qt.pro"
		  (("moonlight-common-c \\\\") "#moonlight-common-c \\")
		  (("qmdnsengine \\\\") "#qmdnsengine \\")
		  ;(("bs.h") "h264bitstream/bs.h")
		  ;(("") "h264bitstream/")
		  ;(("") "h264bitstream/")
		  ;(("") "h264bitstream/")
		  (("app \\\\") "app")
		  (("h264bitstream \\\\") "#h264bitstream \\")
		  (("app.depends") "INCLUDEPATH +="))
		  (invoke "qmake"))))))
  (native-inputs (list pkg-config qttools))
  (inputs (list moonlight-common libva libvdpau openssl opus qtbase-5
  qtquickcontrols2 qtdeclarative qtsvg qmdnsengine sdl2 sdl2-ttf h264bitstream ffmpeg))
  (synopsis "GameStream client for PCs")
  (description "Moonlight PC is an open source implementation of NVIDIA's GameStream, as used by the NVIDIA Shield.")
  (home-page "https://moonlight-stream.org")
  (license license:gpl3)))

(define-public moonlight-common
  (let ((commit "8c55c086d596607041e4394fb62a1bc800b7f37c")
        (revision "1"))
(package
  (name "moonlight-common")
  (version commit)
  (source (origin
            (method git-fetch)
            (uri (git-reference
             (url "https://github.com/moonlight-stream/moonlight-common-c")
             (commit version)))
            (file-name (git-file-name name version))
            (sha256
             (base32
              "0pqm0a2p2sqvazv5gak6gl7d405kaaq6r13l7yhycm0myayqavrp"))))
  (build-system cmake-build-system)
  (arguments
    `(#:tests? #f
      #:phases
      (modify-phases %standard-phases
        (add-after 'unpack 'use-enet-pkg
          (lambda _
            (substitute* "CMakeLists.txt"
              (("add_subdirectory\\(enet\\)") ""))))
		(replace 'install
		(lambda* (#:key outputs source #:allow-other-keys)
		(let* ((out (assoc-ref outputs "out"))
		      (include (string-append out "/include"))
		      (lib (string-append out "/lib")))
		(mkdir-p include)
		(mkdir-p lib)
		(install-file (string-append source "/src/Limelight.h") include)
		(install-file "libmoonlight-common-c.so" lib)))))))
  (native-inputs (list pkg-config))
  (inputs (list qtbase-5
            openssl
            enet-moonlight))
  (synopsis "Core implementation of Nvidia's GameStream protocol")
  (description "This package provides the code GameStream code shared between @code{Moonlight} clients.")
  (home-page "https://github.com/moonlight-stream/moonlight-common-c")
  (license license:gpl3))))

(define-public h264bitstream
  (let ((commit "34f3c58afa3c47b6cf0a49308a68cbf89c5e0bff")
        (revision "1"))
(package
  (name "h264bitstream")
  (version commit)
  (source (origin
            (method git-fetch)
            (uri (git-reference
             (url "https://github.com/aizvorski/h264bitstream")
             (commit version)))
            (file-name (git-file-name name version))
            (sha256
             (base32
              "0rrhzckz2a89q0chw2bfl4g89yiv9a0dcqcj80lcpdr3a1ix8q85"))))
  (build-system gnu-build-system)
  (arguments
    '(#:tests? #f))
  (native-inputs (list autoconf automake libtool pkg-config))
  (inputs (list ffmpeg))
  (synopsis "Library to read and write H.264 video bitstreams")
  (description "This package provides the code GameStream code shared between @code{Moonlight} clients.")
  (home-page "https://github.com/aizvorski/h264bitstream")
  (license license:lgpl2.1))))

(define-public enet-moonlight
  (let ((commit "4cde9cc3dcc5c30775a80da1de87f39f98672a31")
        (revision "1"))
(package
  (inherit enet)
  (name "enet")
  (version commit)
  (source (origin
            (method git-fetch)
            (uri (git-reference
             (url "https://github.com/cgutman/enet")
             (commit version)))
            (file-name (git-file-name name version))
            (sha256
             (base32
              "07sr32jy989ja23fwg8bvrq2slgm7bhfw6v3xq7yczbw86c1dndv"))))
    (build-system cmake-build-system)
	(arguments
	'(#:tests? #f
	  #:phases
	  (modify-phases %standard-phases
	   (add-after 'unpack 'build-share-lib
	   (lambda* _
	   (substitute* "CMakeLists.txt"
	   (("STATIC") "SHARED"))))
	   (replace 'install
	    (lambda* (#:key outputs source #:allow-other-keys)
		(let* ((out (assoc-ref outputs "out"))
		       (include (string-append out "/include"))
		       (lib (string-append out "/lib")))
		(mkdir-p include)
		(mkdir-p lib)
		(copy-recursively (string-append source "/include") include)
		(install-file "libenet.so" lib)))))))
    (native-inputs
     (list pkg-config)))))

(define-public qmdnsengine
  (let ((commit "b7a5a9f225d5e14b39f9fd1f905c4f505cf2ee99")
        (revision "1"))
(package
  (name "qmdnsengine")
  (version commit)
  (source (origin
            (method git-fetch)
            (uri (git-reference
             (url "https://github.com/cgutman/qmdnsengine")
             (commit version)))
            (file-name (git-file-name name version))
            (sha256
             (base32
              "1f5v5n9w4aszcdjxmw81cwmd26ssywvfiyr8x0vbyamp4kqd8mww"))))
  (build-system cmake-build-system)
  (arguments
  '(#:configure-flags (list "-DBUILD_TESTS=ON")))
  (inputs (list qtbase-5))
  (synopsis "Multicast DNS library for Qt application")
  (description "This package provides multicast DNS library for Qt
  applications.")
  (home-page "https://github.com/moonlight-stream/moonlight-common-c")
  (license license:expat))))

