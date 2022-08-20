(define-module (expanse packages cobang)
  #:use-module (guix packages)
  #:use-module (gnu packages aidc)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix git-download)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system cargo)
  #:use-module ((guix licenses) #:prefix license:))

(define-public cobang
 (package
  (name "cobang")
  (version "0.9.6")
  (source (origin
            (method git-fetch)
            (uri (git-reference
                   (url "https://github.com/hongquan/CoBang")
                   (commit (string-append "v" version))))
            (file-name (git-file-name name version))
            (sha256
             (base32
              "0z686vvsnc2rsxws2h99vsx6jzd55l50s6m7284jn59003dx1ib1"))))
  ;; Change to cargo and add phases
  (build-system meson-build-system)
;  (arguments
;  `(#:phases
;	(modify-phases %standard-phases
;	 (delete 'build)
;	 (replace 'install
;	 (lambda* (#:key outputs #:allow-other-keys)
;	 (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
;	 (install-file "app.py" bin)))))))
  (native-inputs (list desktop-file-utils `(,glib "bin") `(,gtk+ "bin"
  ) pkg-config))
  (inputs (list glib gobject-introspection gtk+ hicolor-icon-theme))
  (synopsis "QR code scanner")
  (description "This package provides application to scan QR codes.")
  (home-page "https://gitlab.gnome.org/World/decoder")
  (license license:gpl3+)))
