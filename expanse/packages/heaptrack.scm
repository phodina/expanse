(define-module (expanse packages heaptrack)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (gnu packages)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages kde)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages libunwind)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages sphinx)
  #:use-module (gnu packages qt)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:))

(define-public heaptrack
(package
  (name "heaptrack")
  (version "1.3.0")
  (source (origin
            (method git-fetch)
            (uri (git-reference
             (url "https://github.com/KDE/heaptrack")
             (commit (string-append "v" version))))
            (file-name (git-file-name name version))
            ;; https://invent.kde.org/sdk/heaptrack/-/issues/2
			;; Fixes failing test
			(patches '("patches/heaptrack-tst_parser-test-fix.patch"))
            (sha256
             (base32
              "05b3jpjmp0xvwis5kigpkbpgd0ry8wwyffznhwzbd9gcw9m2az0r"))))
  (build-system cmake-build-system)
  (outputs '("out" "gui"))
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
  (native-inputs (list extra-cmake-modules pkg-config qttools ))
  (inputs (list qtbase-5 qtsvg kio qtquickcontrols2 qtquickcontrols kitemmodels kcoreaddons ki18n kdiagram
  kiconthemes kconfigwidgets threadweaver zlib `(,zstd "lib") boost libunwind))
  (synopsis "Heap memory profiler")
  (description "")
  (home-page "https://github.com/KDE/heaptrack")
  ;; TODO: Multiple
  (license license:gpl3)))
