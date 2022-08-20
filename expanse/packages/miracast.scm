(define-module (expanse packages miracast)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix download)
  #:use-module (gnu packages check)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module (guix build-system python)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:))

(define-public miraclecast
; decoupled from systemd
(let ((commit "665e3ac029c834dbb6ba68a40022ebb95301d957")
      (revision "1"))
  (package
    (name "miraclecast")
    (version "1.0")
    (home-page "https://github.com/albfan/miraclecast")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page)
	   (commit commit)))
       (sha256
        (base32
         "13xlay747mczfaxnqj67rnrz5jmnyrn1z0qv9x77bv8ywr0fwbz7"))))
    (build-system meson-build-system)
	(arguments 
	(list #:configure-flags #~(list "-DENABLE_SYSTEMD=false")))
	(native-inputs (list pkg-config))
    (synopsis "Connect external monitors to your system via Wifi-Display")
    (description "")
    (license (list license:gpl2+ license:lgpl2.1+)))))

(define-public gnome-network-displays
  (package
    (name "gnome-network-displays")
    (version "0.90.5")
    (home-page "https://gitlab.gnome.org/GNOME/gnome-network-displays")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page)
	   (commit (string-append "v" version))))
       (sha256
        (base32
         "06kmz5mn66xfr2jjx2apy7rv2knpxk9a17mbxd5ims8k4h07xkj9"))))
    (build-system meson-build-system)
	(native-inputs (list gettext-minimal pkg-config))
	(inputs (list gstreamer gst-rtsp-server gst-plugins-base))
    (synopsis
     "Miracast implementation for GNOME")
    (description
     "")
    (license license:gpl3+)))

; TODO: Update gstreamer to 1.20.2
(define-public gst-rtsp-server
  (package
    (name "gst-rtsp-server")
    (version "1.19.2")
    (home-page "https://github.com/GStreamer/gst-rtsp-server")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "git://anongit.freedesktop.org/gstreamer/gst-rtsp-server")
	   (commit version)))
       (sha256
        (base32
         "0nrr4z11cdz0hd3mnm186f7nmjy556ikpjhfksf23630shi61knr"))))
    (build-system meson-build-system)
	(native-inputs (list pkg-config))
	(inputs (list glib gstreamer))
    (synopsis
     "RTSP server based on GStreamer")
    (description
     "")
    (license license:lgpl2.1)))


(define-public python-getmac
  (package
    (name "python-getmac")
    (version "0.8.3")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "getmac" version))
              (sha256
               (base32
                "11pl79b7c0rd5ymh0wg8ddjylkyqcnzfdk42z4zgb4lp7c1gjf3f"))))
    (build-system python-build-system)
	(native-inputs (list python-pytest))
    (home-page "https://github.com/GhostofGoes/getmac")
    (synopsis "Get MAC addresses of remote hosts and local interfaces")
    (description "Get MAC addresses of remote hosts and local interfaces")
    (license license:expat)))

(define-public python-wakeonlan
  (package
    (name "python-wakeonlan")
    (version "2.1.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "wakeonlan" version))
              (sha256
               (base32
                "1010iz1d7ad8rj13glzj1mrrgbynqrqwkcc4z0qxsmi2yz6xvpn9"))))
    (build-system python-build-system)
    (home-page "https://github.com/remcohaszing/pywakeonlan")
    (synopsis "A small python module for wake on lan.")
    (description
     "This package provides a small python module for wake on lan.")
    (license license:expat)))

(define-public lgwebosremote
(let ((commit "a430090ac7426ac1346008f12f9ff268d3a94e0b")
      (revision "1"))
  (package
    (name "lgwebosremote")
    (version (git-version "0.1.2" revision commit))
    (home-page "https://github.com/klattimer/LGWebOSRemote")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url home-page)
	   (commit commit)))
       (sha256
        (base32
         "01vn39lwjdbs98zddcf385np1bj6jvc6125dda7n0sd7rsnq0z04"))))
    (build-system python-build-system)
	(arguments (list #:tests? #f))
	(native-inputs (list gettext-minimal pkg-config))
	(inputs (list python-requests python-getmac python-ws4py
	python-wakeonlan))
    (synopsis
     "Command line webOS remote for LG TVs")
    (description
     "This package provides command line webOS remote for LGTVs over
websocket on port 3000.")
    (license license:expat))))
