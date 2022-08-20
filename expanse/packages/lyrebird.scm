(define-module (expanse packages lyrebird)
  #:use-module (guix packages)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages python-build)
  #:use-module (guix git-download)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:))

(define-public lyrebird
 (package
  (name "lyrebird")
  (version "1.1.0")
  (source (origin
            (method git-fetch)
            (uri (git-reference
                   (url "https://github.com/lyrebird-voice-changer/lyrebird")
                   (commit (string-append "v" version))))
            (file-name (git-file-name name version))
            (sha256
             (base32
              "0wmnww2wi8bb9m8jgc18n04gjia8pf9klmvij0w98xz11l6kxb13"))))
  (build-system python-build-system)
  (arguments
  `(#:use-setuptools? #f
    #:tests? #f
    #:phases
	(modify-phases %standard-phases
	 (delete 'build)
	 (replace 'install
	 (lambda* (#:key outputs #:allow-other-keys)
	 (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
	 (install-file "app.py" bin)))))))
  (inputs (list gtk+ python-toml))
  (synopsis "Voice changer")
  (description "This package provides a  voice changer.")
  (home-page "https://github.com/lyrebird-voice-changer/lyrebird")
  (license license:expat)))
