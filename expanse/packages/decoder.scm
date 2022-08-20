(define-module (expanse packages decoder)
  #:use-module (guix packages)
  #:use-module (gnu packages aidc)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix git-download)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system cargo)
  #:use-module ((guix licenses) #:prefix license:))

(define-public decoder
 (package
  (name "decoder")
  (version "0.2.1")
  (source (origin
            (method git-fetch)
            (uri (git-reference
                   (url "https://gitlab.gnome.org/World/decoder")
                   (commit version)))
            (file-name (git-file-name name version))
            (sha256
             (base32
              "1fhhzxv36zlx3i9as0lf1jii979afbgflyw436bc9hk1nzvmrhq7"))))
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
  (native-inputs (list `(,glib "bin") pkg-config))
  (inputs (list glib gstreamer gst-plugins-base gst-plugins-bad gtk libadwaita
  zbar))
  (synopsis "Scan and Generate QR Codes")
  (description "This package provides application to scan and generate QR
codes.")
  (home-page "https://gitlab.gnome.org/World/decoder")
  (license license:gpl3+)))
