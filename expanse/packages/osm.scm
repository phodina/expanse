(define-module (expanse packages osm)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages crates-io)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:))

(define-public osmin
  (package
    (name "osmin")
    (version "1.8.7")
    (home-page "https://github.com/janbar/osmin")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page)
	   (commit version)))
       (sha256
        (base32
         "2gfbi58jj9p58sljfvpaficwzvn6j564a98ccb17jzrbgp49r7va"))))
    (build-system cmake-build-system)
	(native-inputs (list pkg-config))
	(inputs (list qtremoteobjects qtdeclarative qtquickcontrols2
	qtsvg qtsensors qtmultimedia qtpositioning
	qtgraphicaleffects libosmscout))
    (synopsis
     "GPS Navigator On-Road/Off-Road")
    (description "")
    (license license:gpl3+)))

(define-public libosmscout
  (package
    (name "osmin")
    (version "1.1.0")
    (home-page "https://github.com/Framstag/libosmscout")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page)
	   (commit version)))
       (sha256
        (base32
         "3gfbi58jj9p58sljfvpaficwzvn6j564a98ccb17jzrbgp49r7va"))))
    (build-system cmake-build-system)
    (synopsis
     "Offline map rendering, routing and location lookup")
    (description "")
    (license license:lgpl2.0)))
