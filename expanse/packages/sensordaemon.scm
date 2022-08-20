(define-module (expanse packages sensordaemon)
  #:use-module (guix packages)
  #:use-module (gnu packages linux)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:))

(define-public sensordaemon
(let ((commit "d966ba69cae4d1bdff076dece61dc5eaf4f7339b")
      (revision "1"))
 (package
  (name "sensordaemon")
  (version (git-version "0.1-pre" revision commit))
  (source
  (origin
            (method git-fetch)
            (uri (git-reference
                   (url "https://github.com/calebccff/sensordaemon-re")
                   (commit commit)))
            (file-name (git-file-name name version))
            (sha256
             (base32
              "0ryk4w8q6zfmia71nwnk5b7xaxw0sf45dw9q50xp7k76i3k5f9f3"))))
  (build-system gnu-build-system)
  (arguments
  `(#:phases
    (modify-phases %standard-phases
	 (delete 'configure))))
  (inputs (list eudev qrtr))
  (synopsis "Sensor daemon for Snapdragon Sensor Core")
  (description "This package provides a sensor daemon for Snapdragon Sensor Core.")
  (home-page "https://github.com/calebccff/sensordaemon-re")
  (license #f))))

(define-public qrtr
(let ((commit "9dc7a88548c27983e06465d3fbba2ba27d4bc050")
      (revision "1"))
 (package
  (name "qrtr")
  (version (git-version "0.1-pre" revision commit))
  (source
  (origin
            (method git-fetch)
            (uri (git-reference
                   (url "https://github.com/andersson/qrtr")
                   (commit commit)))
            (file-name (git-file-name name version))
            (sha256
             (base32
              "076k28py3cvjsczhm0dfqnnigr2crgc3x33xflkzw8p9yanq973q"))))
  (build-system gnu-build-system)
  (arguments
  `(#:phases
    (modify-phases %standard-phases
	 (delete 'configure))))
  (synopsis "")
  (description "")
  (home-page "https://github.com/andersson/qrtr")
  (license license:bsd-3))))
