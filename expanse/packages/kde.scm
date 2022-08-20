(define-module (expanse packages kde)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages nettle)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages python-xyz)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:))

(define-public kodaskanna
  (package
    (name "kodaskanna")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/KDE/kodaskanna") 
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "075d362nl369f4f08jaxv40i0znkixnfbwxzf5nqx1a1i8q3rimc"))))
    (build-system cmake-build-system)
	(native-inputs (list extra-cmake-modules pkg-config))
	(inputs (list kcoreaddons kwidgetsaddons kconfigwidgets kio purpose ki18n qtbase-5 qtmultimedia))
    (home-page "https://apps.kde.org/cs/kodaskanna/")
    (synopsis
     "Utility for reading data from 1D/2D codes")
    (description "")
    (license license:lgpl2.1+)))

(define-public ksyndication
  (package
    (name "ksyndication")
    (version "5.97.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://invent.kde.org/frameworks/syndication") 
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "0ljg5mwkqpv5saw7kn8zc3im2jk7kqf703gi5anvx0idk0z7hrir"))))
    (build-system cmake-build-system)
	(native-inputs (list extra-cmake-modules))
;	(inputs (list kconfig ki18n kcoreaddons kirigami ksyndication libtag
;	qtkeychain qtbase-5 qtdeclarative-5
;	qtquickcontrols2-5 qtmultimedia-5))
    (home-page "https://invent.kde.org/frameworks/syndication")
    (synopsis
     "Syndication library")
    (description "This package provides RSS/Atom parser library.")
    (license (list license:bsd-2 license:gpl2+ license:lgpl2.0+))))

(define-public kasts
  (package
    (name "kasts")
    (version "22.06")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://invent.kde.org/plasma-mobile/kasts") 
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "0mgpjvqdlizvgps7p4dvczrf7xi3ahwb5bpp0aqcdi6n6ndcxjpb"))))
    (build-system cmake-build-system)
	(native-inputs (list extra-cmake-modules))
	(inputs (list kconfig ki18n kcoreaddons kirigami ksyndication taglib
	qtkeychain qtbase-5 qtdeclarative-5
	qtquickcontrols2-5 qtmultimedia-5))
    (home-page "https://invent.kde.org/plasma-mobile/kasts")
    (synopsis
     "Convergent podcast application")
    (description "This package provides convergent podcast application")
    (license (list license:bsd-2 license:bsd-3 license:gpl2+ license:gpl3+
	license:lgpl2.0+ license:lgpl3+))))

(define-public metadata-cleaner
  (package
    (name "metadata-cleaner")
    (version "2.2.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://gitlab.com/rmnvgr/metadata-cleaner") 
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "0kvxq1ycfg7g9jnwahb5y7jhvn8dvcl8j6cvnh73zaf0k3amshna"))))
    (build-system meson-build-system)
	(arguments
	(list 
    #:imported-modules `((guix build python-build-system) ; for site-packages
	                      ,@%meson-build-system-modules)
    #:modules `((guix build python-build-system)
	            (guix build meson-build-system)
			    (guix build utils))
	#:phases
	 #~(modify-phases %standard-phases
          (add-after 'install 'wrap
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((gi-typelib-path   (getenv "GI_TYPELIB_PATH"))
                     (sitedir (site-packages inputs outputs))
                     (python (dirname (dirname
                                          (search-input-file
                                            inputs "bin/python"))))
                     (python-sitedir
                         (string-append python "/lib/python"
                                        (python-version python)
                                        "/site-packages")))
                 (wrap-program (string-append #$output "/bin/metadata-cleaner")
                     `("GI_TYPELIB_PATH" ":" prefix (,gi-typelib-path))
                       `("GUIX_PYTHONPATH" ":" suffix
                         ,(list sitedir python-sitedir)))))))))
	(native-inputs (list bash-minimal desktop-file-utils gettext-minimal `(,glib "bin") `(,gtk "bin") itstool pkg-config))
	(inputs (list python gtk))
    (home-page
	"https://metadatacleaner.romainvigier.fr/")
    (synopsis
     "View and clean metadata in files")
    (description "")
    (license license:gpl3+)))

(define-public darmstadt
  (package
    (name "darmstadt")
    (version "1.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/tildearrow/darmstadt") 
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "0yn6vifj8f4bk5ni6pjsadjiapmdzyfn7yc9j30sd0rixsr5k1n9"))))
    (build-system cmake-build-system)
    (home-page
	"https://github.com/tildearrow/darmstadt")
    (synopsis
     "Hardware accelerated screen capture tool")
    (description "")
	; multiple
    (license license:gpl3+)))

(define-public furnace
  (package
    (name "furnace")
    (version "0.5.8")
    (home-page "https://github.com/tildearrow/furnace")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page) 
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "0h8khxk6hz5b3pm98aflg9dadgpgb8c4xpcbw76dfdv7jw2r3cj7"))))
    (build-system cmake-build-system)
    (synopsis "Multi-system chiptune tracker compatible with DefleMask modules")
    (description "")
    (license license:gpl2+)))

(define-public lightflyer
  (package
    (name "lightflyer")
    (version "0.4.1")
    (home-page "https://github.com/Luwx/Lightly")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page) 
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "2h1khxk6hz5b3pm98aflg9dadgpgb8c4xpcbw76dfdv7jw2r3cj7"))))
    (build-system cmake-build-system)
    (synopsis "Modern style for Qt applications")
    (description "")
    (license license:gpl2+)))

(define-public latencytool
; no releases
(let ((commit "14086ba23902b467b73f6e3da472b7c8899a661d")
      (revision "1"))
  (package
    (name "latencytool")
    (version "")
    (home-page "https://github.com/mstoeckl/latencytool")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page) 
	   (commit commit)))
       (sha256
        (base32
         "1h4khxk6hz5b3pm98aflg9dadgpgb8c4xpcbw76dfdv7jw2r3cj7"))))
    (build-system gnu-build-system)
	(arguments
	(list #:phases
    #~(modify-phases %standard-phases
	   (delete 'configure))))
	(native-inputs (list pkg-config))
    (synopsis "Measure round trip latency")
    (description "This package Measure round trip latency from application
to screen to camera to application.")
    (license #f))))

; Needs newer ECM
(define-public eink-lookandfeel
(let ((commit "8d0914bc179bb8f83c96aa2b1911cd12604954ce")
      (revision "1"))
  (package
    (name "eink-lookandfeel")
    (version "")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://invent.kde.org/apol/plasma-ink") 
	   (commit commit)))
       (sha256
        (base32
         "1h4khxk6hz5b3pm98aflg9dadgpgb8c4xpcbw76dfdv7jw2r3cj7"))))
    (build-system cmake-build-system)
	(native-inputs (list extra-cmake-modules))
    (home-page
	"https://invent.kde.org/apol/plasma-ink")
    (synopsis
     "EInk theme for Plasma")
    (description "")
    (license #f))))

; Add inputs
(define-public pikasso
(let ((commit "b72ceb5485eb3af5f8fbce63f807045c4057f1bb")
      (revision "1"))
  (package
    (name "pikasso")
    (version "")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://invent.kde.org/graphics/pikasso/") 
	   (commit commit)))
       (sha256
        (base32
         "1900857gxfg3cs50rlv2qvvkzzbdz2gksxm02cjj3nqb27yqznz8"))))
    (build-system cmake-build-system)
	(native-inputs (list extra-cmake-modules))
	(inputs (list qtbase-5))
    (home-page
	"https://invent.kde.org/graphics/pikasso/")
    (synopsis
     "Simple drawing program")
    (description "")
    (license #f))))

; needs newer kconfig
(define-public ktrip
  (package
    (name "ktrip")
    (version "22.04")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://invent.kde.org/utilities/ktrip") 
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "0mlq77nfgkkcqlqyyxalx929l3iy87psmjrlksk8zkck6zcdahfy"))))
    (build-system cmake-build-system)
	(native-inputs (list extra-cmake-modules))
	(inputs (list kcoreaddons ki18n kitemmodels kconfig qtbase-5 qtdeclarative qtquickcontrols2))
    (home-page "https://apps.kde.org/ktrip/")
    (synopsis "Helps you navigate in public transport")
    (description "This package allows you to find journeys between specified
locations, departures for a specific station and shows real-time delay and
disruption information.")
    (license license:gpl2+)))

; Fails due to -fpermissive
(define-public mauikit
  (package
    (name "mauikit")
    (version "2.1.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://invent.kde.org/maui/mauikit") 
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "153vqj3b0ldwf0xpd5g3f0y3pfnszj4gzwrdl1s4pbp4lhrfdvvw"))))
    (build-system cmake-build-system)
	(native-inputs (list extra-cmake-modules))
	(inputs (list ki18n kcoreaddons knotifications  kwindowsystem kconfig qtbase-5 qtdeclarative qtquickcontrols2 qtsvg
	qtx11extras qtgraphicaleffects xcb-util-wm))
    (home-page "https://mauikit.org/")
    (synopsis "Modular forn-end framewokr for developing user experiences")
    (description "")
    (license license:gpl2+)))

; https://invent.kde.org/maui
; https://apps.kde.org/kodaskanna/
(define-public deepin-icons
(let ((commit "52c8cc1e2d558139954cf19857f09003e7ee705e")
      (revision "1"))
  (package
    (name "deepin-icons")
    (version "")
    (home-page
	"https://github.com/zayronxio/Deepin-icons-2022")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page)
	   (commit commit)))
       (sha256
        (base32
         "1900857gxfg3cs50rlv2qvvkzzbdz2gksxm02cjj3nqb27yqznz8"))))
    (build-system copy-build-system)
    (synopsis
     "Icons inspired by deepin OS icons")
    (description "")
    (license #f))))

(define-public big-sur-icons
(let ((commit "52c8cc1e2d558139954cf19857f09003e7ee705e")
      (revision "1"))
  (package
    (name "big-sur-icons")
    (version "")
    (home-page
	"https://github.com/zayronxio/Mkos-Big-Sur")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page)
	   (commit commit)))
       (sha256
        (base32
         "1900857gxfg3cs50rlv2qvvkzzbdz2gksxm02cjj3nqb27yqznz8"))))
    (build-system copy-build-system)
    (synopsis
     "Icons inspired by MacOS icons")
    (description "")
    (license #f))))

(define-public win11-icon-theme
(let ((commit "")
      (revision "1"))
  (package
    (name "big-sur-icons")
    (version "")
    (home-page
	"https://github.com/yeyushengfan258/Win11-icon-theme")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page)
	   (commit commit)))
       (sha256
        (base32
         "1900857gxfg3cs50rlv2qvvkzzbdz2gksxm02cjj3nqb27yqznz8"))))
    (build-system copy-build-system)
    (synopsis
     "Icons inspired by Win11 icons")
    (description "")
    (license license:gpl3+))))

;; https://archlinux.org/groups/x86_64/deepin/
;; https://invent.kde.org/maui?page=1
