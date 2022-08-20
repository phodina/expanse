(define-module (expanse packages drm)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xdisorg)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:))

(define-public drm-info
  (package
    (name "drm-info")
    (version "2.3.0")
    (home-page "https://github.com/ascent12/drm_info")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page)
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "0n62jcy8x173kxkbyk23lbbzp9gqisgj4hkgr3136yyhxlnxhc2i"))))
    (build-system meson-build-system)
	(arguments
	(list #:tests? #f)) ; no test suite
	(native-inputs (list pkg-config))
	(inputs (list libdrm json-c))
    (synopsis "Small utility to dump info about DRM devices")
    (description "")
    (license license:expat)))
