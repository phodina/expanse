(define-module (expanse packages elf-dissector)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (gnu packages)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages kde)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages libunwind)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages qt)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:))

(define-public elf-dissector
(let ((commit "cfe52533202e350d8cfa7714eb31927e5174d8a0")
      (revision "1"))
(package
  (name "elf-dissector")
  (version "")
  (source (origin
            (method git-fetch)
            (uri (git-reference
             (url "https://invent.kde.org/sdk/elf-dissector")
             (commit commit)))
            (file-name (git-file-name name version))
            (sha256
             (base32
              "0g0vqgf213nj2bx0dq8z3j2p33cfq3wmwyh09mwz43z565zgr1x2"))))
  (build-system cmake-build-system)
;  (arguments
;   `(#:phases
;    (modify-phases %standard-phases
;     (add-after 'install 'move-gui
;     (lambda* (#:key outputs #:allow-other-keys)
;	 (let* ((out (assoc-ref outputs "out"))
;	        (gui (assoc-ref outputs "gui")))
;			(mkdir-p (string-append gui "/bin")
;			(invoke "ls" (string-append out "/bin"))
;			;starting phase `move-gui'
;;heaptrack
;;heaptrack_gui
;;heaptrack_print
;			(rename-file (string-append out "/bin/heaptrack_gui")
;			(string-append gui "/bin/heaptrack_gui")))))))))
  (native-inputs (list extra-cmake-modules pkg-config))
  (inputs (list libiberty qtbase-5 kitemmodels))
  (synopsis "Tools for inspecting, analyzing and optimizing ELF files")
  (description "")
  (home-page "https://invent.kde.org/sdk/elf-dissector")
  ;; TODO: Multiple
  (license license:gpl2+))))
