(define-module (expanse packages latencyflex)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages xml)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:))

(define-public latencyflex
  (package
    (name "latencyflex")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/ishitatsuyuki/LatencyFleX")
	   (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0n75gn4yx253kx5qdbjfj2vw59q5zjc9sw45bjakys1l11rr1had"))))
    (build-system meson-build-system)
    (arguments
     (list 
	   #:tests? #f
       #:phases
	   #~(modify-phases %standard-phases
	    (add-after 'unpack 'chdir
		 (lambda* (#:key build-inputs #:allow-other-keys)
		  (chdir "layer"))))))
    ;(native-inputs (list unzip))
	;(inputs (list python-lxml python-pyusb python-pillow python-pyclipper))
	(inputs (list funchook))
    (home-page "https://www.scorchworks.com/K40whisperer/k40whisperer.html")
    (synopsis "Control software for the stock K40 Laser controller")
    (description "")
    (license license:gpl3+)))

(define-public funchook
  (package
    (name "funchook")
    (version "1.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/kubo/funchook")
	   (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "10l2kbw23qlbnmf5flwkn2krnhd912q70m3wmb8v8iplxg27f6xq"))))
    (build-system cmake-build-system)
	(inputs (list distorm))
    (home-page "https://www.scorchworks.com/K40whisperer/k40whisperer.html")
    (synopsis "Control software for the stock K40 Laser controller")
    (description "")
    (license license:gpl2+)))

(define-public distorm
  (package
    (name "distorm")
    (version "3.5.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/gdabah/distorm")
	   (commit (string-append version "b"))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1if9cd7czny6ll3pf4fmazgjcwxpy3ir6ypzxp9p2jycfibl9yyr"))))
    (build-system python-build-system)
    (home-page "https://www.scorchworks.com/K40whisperer/k40whisperer.html")
    (synopsis "Control software for the stock K40 Laser controller")
    (description "")
    (license license:bsd-3)))

(define-public zydis
  (package
    (name "zydis")
    (version "3.2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/zyantific/zydis")
	   (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "171sq0aw74wl0xbkxr3q62cs4dng6xzscyziihgq86zp1pafj06p"))))
    (build-system cmake-build-system)
    (home-page "https://www.scorchworks.com/K40whisperer/k40whisperer.html")
    (synopsis "Control software for the stock K40 Laser controller")
    (description "")
    (license license:expat)))

(define-public zycore
  (package
    (name "zycore")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/zyantific/zycore-c")
	   (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "06sa17hzhs9mwba8339qadn51nzvfgcfcnvc49rn33yzcvbs9yzb"))))
    (build-system cmake-build-system)
	(arguments
	`(#:configure-flags '("-DZYCORE_BUILD_TESTS=ON")))
	(native-inputs (list googletest pkg-config))
    (home-page "https://www.scorchworks.com/K40whisperer/k40whisperer.html")
    (synopsis "Control software for the stock K40 Laser controller")
    (description "")
    (license license:expat)))
