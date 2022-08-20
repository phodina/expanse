(define-module (expanse packages upstream)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages nettle)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:))

(define-public liborigin
(let ((commit "a92f26f28e531f64684b66a2731dd617bea3cb45")
      (revision "1"))
  (package
    (name "liborigin")
    (version (git-version "3.0.0" revision commit))
    (home-page "https://github.com/SciDAVis/liborigin")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page) 
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "1yn6vifj8f4bk5ni6pjsadjiapmdzyfn7yc9j30sd0rixsr5k1n9"))))
    (build-system cmake-build-system)
    (synopsis
     "library for reading OriginLab OPJ project files ")
    (description "This package provides a library for reading OriginLab OPJ
project files.")
    (license license:gpl2+))))

(define-public qtmqtt
  (package
    (name "qtmqtt")
    (version "6.3.1")
    (home-page "https://github.com/qt/qtmqtt")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page) 
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "1yn6vifj8f4bk5ni6pjsadjiapmdzyfn7yc9j39sd0rixsr5k1n9"))))
    (build-system gnu-build-system)
    (synopsis
     "Qt Module to implement MQTT protocol")
    (description "This package provides Qt Module to implement MQTT protocol
version 3.1 and 3.1.1")
    (license (list license:bsd-3 license:gpl3+))))

(define-public cantor
  (package
    (name "cantor")
    (version "22.07.90")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://invent.kde.org/education/cantor") 
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "1kiqzikyd322q7yb30gfb7m995a79947xswl5z1wdqxpxd21a6dm"))))
    (build-system cmake-build-system)
	(native-inputs (list extra-cmake-modules pkg-config))
	(inputs (list karchive qtbase-5))
    (home-page
	"https://apps.kde.org/cs/cantor/")
    (synopsis
     "Front end to powerful mathematics and statistics packages")
    (description "")
    (license (list license:bsd-3 license:gpl2+ license:gpl3))))

(define-public s2geometry
  (package
    (name "s2geometry")
    (version "0.10.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/google/s2geometry") 
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "1y6rs3qv0nk32b8r8nvninkjqab96g3cw1gmfjy975r0d7icap8m"))))
    (build-system cmake-build-system)
	(inputs (list openssl abseil-cpp))
    (home-page
	"http://s2geometry.io/")
    (synopsis "Computational geometry and spatial indexing on the sphere")
    (description "This package provides Computational geometry and spatial
	indexing on the sphere.")
    (license license:asl2.0)))

(define-public pure-maps
  (package
    (name "pure-maps")
    (version "3.1.0")
    (home-page "https://github.com/rinigus/pure-maps")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page)
	   (commit version)))
       (sha256
        (base32
         "1mjgb5wjprapaxsddlrshbafzjp408kzsfxc3b9af1y2jfrkx0da"))))
    (build-system cmake-build-system)
	(arguments
	 (list #:phases
     #~(modify-phases %standard-phases
	    (add-after 'unpack 'third-party
		(lambda* _
		 (copy-recursively #$(origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/tkrajina/gpxpy")
	   (commit "b9219a9f1758edbd277a138c77703028af367ce4")))
       (sha256
        (base32
         "0vl3069c2hk8ijl1a398cw9v92gak42xq7dqr3bpa2y5jny2ml50")))
		 "thirdparty/gpxpy")
		 (copy-recursively #$(origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/rinigus/geomag")
	   (commit "8eb9a730c8643fb7d63fdee4fd9a195ee8ba4df2")))
       (sha256
        (base32
         "1c1s75g3xfjib396y486sdbqsp4rkpvvcla3j2221symdx1l29s2")))
		 "thirdparty/geomag")
		 (copy-recursively #$(origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/heremaps/flexible-polyline")
	   (commit "8354fbe0d3f3692aa68d8694368a252c791e91cb")))
       (sha256
        (base32
         "1nx6qpvlbmv69mzg1m661bkmz56xmmzggav90s0rhmq6r6k3n465")))
		 "thirdparty/flexible-polyline"))))))
	(native-inputs (list gettext-minimal qttools-5))
	(inputs (list s2geometry python qtbase-5 qtlocation qtdeclarative-5 qtquickcontrols2-5))
    (synopsis
     "Maps and navigation")
    (description "")
    (license license:gpl3+)))

(define-public confy
  (package
    (name "confy")
    (version "0.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://git.sr.ht/~fabrixxm/confy") 
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "1w69fhaw0r0alzw9kggr37a4pdgcs4zggkfg5qs8p48lsv7m9d7d"))))
    (build-system meson-build-system)
	(arguments
	(list
#:glib-or-gtk? #t
	#:phases
	 #~(modify-phases %standard-phases
	 (add-after 'unpack 'skip-gtk-update-icon-cache
;; Don't create 'icon-theme.cache'.
(lambda _
  (substitute* "build-aux/meson/postinstall.py"
    (("gtk-update-icon-cache") "true"))))
  (add-after 'install 'wrap-gi-python
;; Make GTK find files needed by plugins.
(lambda* (#:key inputs outputs #:allow-other-keys)
  (let ((out               (assoc-ref outputs "out"))
        (gi-typelib-path   (getenv "GI_TYPELIB_PATH"))
        (python-path       (getenv "GUIX_PYTHONPATH")))
    (wrap-program (string-append out "/bin/confy")
      `("GI_TYPELIB_PATH" ":" prefix (,gi-typelib-path))
      `("GUIX_PYTHONPATH" ":" prefix (,python-path))))
  )))))
	(native-inputs (list `(,glib "bin") `(,gtk+ "bin") desktop-file-utils gettext-minimal pkg-config))
	(inputs (list python gtk+ libhandy python-urllib3 python-pygobject libnotify python-icalendar))
	(home-page "https://confy.kirgroup.net/")
    (synopsis
	"Conferences schedule viewer")
    (description
     "This package provides application to navigate conference schedules and
	 venue.")
    (license #f)))


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
