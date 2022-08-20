(define-module (expanse packages bench)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages python-xyz)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:))

(define-public cutiepi-lxpanel-battery
  (package
    (name "cutiepi-lxpanel-battery")
    (version "")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/BlackLight/cutiepi-lxpanel-battery")
	   (commit version)))
       (sha256
        (base32
         "1dhd82p80c3z775gjsbv31p4z48iqykd34j62x32ic44nvfm1kym"))))
    (build-system gnu-build-system)
    (home-page
     "https://github.com/BlackLight/cutiepi-lxpanel-battery")
    (synopsis
     "LXpanel plugin for the CutiePi battery")
    (description
     "")
    (license license:gpl3+)))

(define-public unixbench
  (package
    (name "unixbench")
    (version "5.1.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/kdlucas/byte-unixbench")
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "1dhd82p80c3z775gjsbv31p4z48iqykd34j62x32ic44nvfm1kym"))))
    (build-system cmake-build-system)
    (home-page
     "https://github.com/kdlucas/byte-unixbench")
    (synopsis
     "UnixBench is the original BYTE UNIX benchmark suite")
    (description
     "")
    (license license:gpl2+)))

; split into different packages based on the HPC
(define-public mixbench
(let ((commit "d04caf30146eba45365c186f610c12d37cccf631")
      (revision "1"))
  (package
    (name "mixbench")
    (version "")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/ekondis/mixbench")
	   (commit commit)))
       (sha256
        (base32
         "1rx23gy7ism0qkl4lf86kw8rf9bc79jfrx2zysanxp67yn8z07ia"))))
    (build-system cmake-build-system)
    (home-page
     "https://github.com/ekondis/mixbench")
    (synopsis
     "GPU benchmark tool")
    (description
     "This package provides  GPU benchmark tool for evaluating GPUs on mixed
	 operational intensity kernels (CUDA, OpenCL, HIP, SYCL) ")
    (license license:expat))))

(define-public hip
  (package
    (name "hip")
    (version "4.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/ROCm-Developer-Tools/HIP")
	   (commit (string-append "rocm-" version))))
       (sha256
        (base32
         "1dhd82p80c3z775gjsbv31p4z48iqykd34j62x32ic44nvfm1kym"))))
    (build-system cmake-build-system)
    (home-page
     "https://github.com/ROCm-Developer-Tools/HIP")
    (synopsis
     "C++ Heterogeneous-Compute Interface for Portability")
    (description
     "")
    (license license:expat)))
