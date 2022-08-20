(define-module (expanse packages kms)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (gnu packages base)
  #:use-module (gnu packages pretty-print)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages xdisorg)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:))


(define-public kmsxx
(let ((commit "2236a8ccacdfed5ff5f6873ed6618eccf570193d")
      (revision "1"))
  (package
    (name "kmsxx")
    (version "")
    (source (origin
              (method git-fetch)
              (uri (git-reference
			  (url "https://github.com/tomba/kmsxx")
			  (commit commit)))
              (sha256
               (base32
                "0nj5a0a9rbqwh269h6hm5v878kz9ajzs77d9lq303jw06wci6dzg"))))
    (build-system meson-build-system)
    (native-inputs (list fmt pkg-config))
    (inputs (list libdrm))
    (home-page "https://github.com/tomba/kmsxx")
    (synopsis "C++!! library, utilites for Linux kernel mode setting")
    (description
     "")
    (license license:mpl2.0))))

; Failing install
(define-public python-pydrm
(let ((commit "ce0b0888c35d56017641c9f7c5f966bf7461552e")
      (revision "1"))
  (package
    (name "python-pydrm")
    (version "")
    (home-page "https://github.com/notro/pydrm")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url home-page)
             (commit commit)))
       (file-name (git-file-name name version))
       (sha256
       (base32
	   "0kwcb436phxxrfd1y9g1vrq5wmb8gqv44nin42yb112ai2ykranh"))))
    (build-system python-build-system)
    (synopsis "DRM library")
    (description "")
    (license license:expat))))

; tests depend on gnome-xsession  gnome-wayland-nested
; failing install
(define-public fly-pie
  (package
    (name "fly-pie")
    (version "16")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Schneegans/Fly-Pie")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "15ixjn962910jx3jnjmbx2lxb5wvv1l1az00rba3s2vbcd7fiwh7"))))
    (build-system gnu-build-system)
    (arguments
     (list
	       #:tests? #f
           #:test-target "test"
           #:phases
		   #~(modify-phases %standard-phases
		   (delete 'configure))))
	(native-inputs (list podman gettext-minimal unzip `(,glib "bin") zip))
	(inputs (list gnome-shell))
    (home-page "http://schneegans.github.io/news/2021/12/02/flypie10")
    (synopsis "Marking menu written as a GNOME Shell extension")
    (description "")
    (license license:expat)))
