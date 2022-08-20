(define-module (expanse packages lk)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages python)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages swig)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system python)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:))

(define-public lk2nd 
(let ((commit
"01alprf4mg5in8vhddfn1ba7q2xjaycqv0f9xnsjzkn2i1anm125")
      (revision "1"))
  (package
    (name "lk2nd")
    (version "0.11.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/msm8916-mainline/lk2nd")
	   (commit commit)))
       (sha256
        (base32
         "22pdq6c5svvn8f8j9csxjc6dc714xf8w2rdrfx2qsqahsg0i20cz"))))
    (build-system gnu-build-system)
    (home-page
     "https://github.com/msm8916-mainline/lk2nd")
    (synopsis
     "Custom bootloader for Qualcomm MSM8916/MSM8226/MSM8974 devices")
    (description
     "")
    (license license:expat))))

(define-public littlekernel
(let ((commit
"01alprf4mg5in8vhddfn1ba7q2xjaycqv0f9xnsjzkn2i1anm125")
      (revision "1"))
  (package
    (name "littlekernel")
    (version "")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/littlekernel/lk")
	   (commit commit)))
       (sha256
        (base32
         "22pdq6c5svvn8f8j9csxjc6dc714xf8w2rdrfx2qsqahsg0i20cz"))))
    (build-system gnu-build-system)
    (home-page
     "https://github.com/littlekernel/lk")
    (synopsis
     "Little kernel")
    (description
     "")
    (license license:expat))))

(define-public rauc
  (package
    (name "rauc")
    (version "1.5.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/rauc/rauc")
	   (commit version)))
       (sha256
        (base32
         "33pdq6c5svvn8f8j9csxjc6dc714xf8w2rdrfx2qsqahsg0i20cz"))))
    (build-system gnu-build-system)
    (home-page
     "https://rauc.io")
    (synopsis
     "Safe and secure updates")
    (description
     "")
    (license license:lgpl2.1)))

(define-public crust
  (package
    (name "crust")
    (version "0.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/crust-firmware/crust")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "33pdq6c5svvn8f8j9csxjc6dc714xf8w2rdrfx2qsqahsg0i11cz"))))
    (build-system gnu-build-system)
    (home-page
     "https://rauc.io")
    (synopsis
     "SCP power management firmware for sunxi SoCs")
    (description
     "")
    (license (list license:bsd-1 license:bsd-3 license:gpl2+ license:expat))))

(define-public linux-mdss-dsi-panel-driver
  (package
    (name "linux-mdss-dsi-panel-driver")
    (version "")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator")
	   (commit version)))
       (sha256
        (base32
         "44pdq6c5svvn8f8j9csxjc6dc714xf8w2rdrfx2qsqahsg0i11cz"))))
    (build-system python-build-system)
    (home-page
     "https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator")
    (synopsis
     "Generate Linux DRM panel kernel driver base on QCOM")
    (description
     "")
    (license license:gpl2+)))

(define-public pantavisor
  (package
    (name "pantavisor")
    (version "012")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/pantavisor/pantavisor")
	   (commit (string-append version "-rc1"))))
       (sha256
        (base32
         "44pdq6c5svvn8f8j9csxjc6dc714xf8w2rdrfx2qsqahsg0i11cz"))))
    (build-system python-build-system)
    (home-page
     "https://pantavisor.io/")
    (synopsis
     "Near bare metal multi-container supervisor and OS management system")
    (description
     "")
    (license license:expat)))
