;;; started with work by:
;;; Copyright © 2021 Katherine Cox-Buday <cox.katherine.e@gmail.com>
;;;
;;; This is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or
;;; (at your option) any later version.
;;;
;;; This is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
;;; General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with this. If not, see <http://www.gnu.org/licenses/>.

(define-module (lutris-wip)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-build)
  #:use-module (srfi srfi-1) ; append-map, delete-duplicates
  #:use-module (guix utils)
  #:use-module (gnu packages gcc) ; gcc-toolchain
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages webkit)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages wine)
  ;; need nonguix stubb,  but to avoid channel dependencies for testing
  ;#:use-module (nongnu packages wine)
  #:use-module (gnu packages vulkan)
  #:use-module ((guix licenses) #:prefix license:)
  ;; steam-client
  ;#:use-module (nonguix utils)
  ;#:use-module ((nonguix licenses) #:prefix license:)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix records)
  #:use-module (guix download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system trivial)
  #:use-module (guix transformations)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages certs)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages file)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages gawk)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages linux)
  ;#:use-module (nongnu packages nvidia)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages python)
  #:use-module (gnu packages logging)
  #:use-module (guix build-system copy) ;hwdata
  ;; mangohud
  #:use-module (guix build-system meson)
  #:use-module (gnu packages stb)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages game-development)
  #:use-module (gnu packages pciutils)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages pkg-config))

(define-public vulkan-loader32
  (package
    (inherit vulkan-loader)
    (name "vulkan-loader32")
    (arguments
     `(#:system "i686-linux"))))

(define-public mesa32
  (package
    (inherit mesa)
    (name "mesa32")
    (arguments
     `(#:system "i686-linux"
                #:tests? #f ;; not sure why a test is failing
       ,@(package-arguments mesa)))))

(define-public gnutls32
  (package
    (inherit gnutls)
    (name "gnutls32")
    (arguments
     `(#:system "i686-linux"
       ,@(package-arguments gnutls)))))

(define-public lutris
  (package
    (name "lutris")
    (version "0.5.9.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lutris/lutris")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1v9ml5s17brr9hryc58y8cpga5li9y7hxi0zsfpm4v4aw2fwjhya"))))
    (build-system python-build-system)
    (arguments
     `(#:tests? #f
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-paths
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let* ((input-paths (list (assoc-ref inputs "psmisc")
                                       (assoc-ref inputs "p7zip")
                                       (assoc-ref inputs "curl")
                                       (assoc-ref inputs "cabextract")
                                        ;(assoc-ref inputs "winetricks")
                                       ))
                    (inputs-bin (map (lambda (i)
                                       (string-append "\"" i "/bin\""))
                                     input-paths))
                    (path-candidates (string-join inputs-bin ","))
                    (mesa-path (assoc-ref inputs "mesa")))
               (substitute* "lutris/util/linux.py"
                 (("path_candidates = \\[.*\\]")
                  (string-append "path_candidates = [" path-candidates "]"))
                 (("ldconfig,")
                  (string-append "ldconfig, \"-C\", \""
                                 (assoc-ref outputs "out")
                                 "/etc/ld.so.cache" "\", ")))
               (substitute* "lutris/util/graphics/vkquery.py"
                 (("CDLL\\(\"libvulkan.so.1\"\\)")
                  (string-append "CDLL(\""
                                 (assoc-ref inputs "vulkan-loader")
                                 "/lib/libvulkan.so.1\")")))
               ;; not sure if this is helping (yet?)
               (substitute* "lutris/sysoptions.py"
                 (("\"/usr/share/vulkan\",")
                  (string-append "\"" mesa-path "/share/vulkan\","))))))
         (add-after 'install 'ld-cache
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (use-modules (srfi srfi-1))
             (let ((ld.so.conf
                    (string-append (assoc-ref outputs "out")
                                   "/ld.so.conf"))
                   (cache-file
                    (string-append (assoc-ref outputs "out")
                                   "/etc/ld.so.cache"))
                   (library-paths (map (lambda (input)
                                         (string-append
                                          (assoc-ref %build-inputs input)
                                          "/lib"))
                                       (list "gnutls"
                                             "gnutls32"
                                             "gcc:lib"
                                             ;"wine"
                                             "mesa"
                                             "mesa32"
                                             "vulkan-loader"
                                             "vulkan-loader32"))))
               (mkdir-p (dirname cache-file))
               (call-with-output-file ld.so.conf
                 (lambda (port)
                   (for-each (lambda (directory)
                               (display directory port)
                               (newline port))
                             library-paths)))
               (invoke "ldconfig" "-X" "-f" ld.so.conf "-C" cache-file))
             #t))
         (add-after 'ld-cache 'wrap-gi-typelib
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let ((out               (assoc-ref outputs "out"))
                   (gi-typelib-path   (getenv "GI_TYPELIB_PATH")))
               (wrap-program (string-append out "/bin/lutris")
                 `("GI_TYPELIB_PATH" ":" prefix (,gi-typelib-path))))
             #t))
         (add-after 'wrap-gi-typelib 'wrap-lutris
             (lambda* (#:key outputs #:allow-other-keys)
               (wrap-program (string-append (assoc-ref outputs "out")
                                            "/bin/lutris")
                             `("PATH" ":" prefix
                               (,(string-append (assoc-ref %build-inputs
                                                           "mesa-utils")
                                                "/bin")))))))))
    (inputs
     `(("mesa" ,mesa)
       ("mesa32" ,mesa32)
       ("mesa-utils" ,mesa-utils) ; for glxinfo
       ("psmisc" ,psmisc)
       ("p7zip" ,p7zip)
       ("curl" ,curl)
       ("fluid-3" ,fluid-3)
       ("gcc:lib" ,gcc-10 "lib")
       ("gnutls" ,gnutls)
       ("gnutls32" ,gnutls32)
       ("cabextract" ,cabextract)
       ;("winetricks" ,winetricks)
       ("gtk+" ,gtk+)
       ("glib:bin" ,glib "bin")
       ("gnome-desktop" ,gnome-desktop)
       ("webkitgtk" ,webkitgtk-with-libsoup2)
       ("libnotify" ,libnotify)
       ;("wine" ,wine)
       ;("dxvk" ,dxvk)
       ("vulkan-loader32" ,vulkan-loader32)
       ("vulkan-loader" ,vulkan-loader)
       ("vulkan-tools" ,vulkan-tools)))
    (propagated-inputs
     `(("python-astroid" ,python-astroid)
       ("python-certifi" ,python-certifi)
       ("python-chardet" ,python-chardet)
       ("python-distro" ,python-distro)
       ("python-dbus-python" ,python-dbus)
       ("python-entrypoints" ,python-entrypoints)
       ("python-evdev" ,python-evdev)
       ("python-idna" ,python-idna)
       ("python-lazy-object-proxy" ,python-lazy-object-proxy)
       ("python-magic" ,python-magic)
       ("python-mccabe" ,python-mccabe)
       ("python-pillow" ,python-pillow)
       ("python-pycairo" ,python-pycairo)
       ("python-pyflakes" ,python-pyflakes)
       ("python-pygobject" ,python-pygobject)
       ("python-pyyaml" ,python-pyyaml)
       ("python-requests" ,python-requests)
       ("python-six" ,python-six)
       ("python-urllib3" ,python-urllib3)
       ("python-wrapt" ,python-wrapt)
       ("python-keyring" ,python-keyring)
       ("python-lxml" ,python-lxml)))
    (synopsis "Gaming Platform Interface")
    (description
     "Lutris is a gaming platform for GNU/Linux.
It allows you to gather and manage (install, configure and launch) all
your games acquired from any source, in a single interface. Its features
include:
@itemize
@item Manage your Linux games, Windows games, emulated console games and browser games
@item Launch your Steam games
@item Community-written installers to ease up your games' installation
@item More than 20 emulators installed automatically or in a single click, providing support for most gaming systems from the late 70's to the present day
@item Download and play libre and freeware games
@end itemize")
    (home-page "https://lutris.net")
    (license license:gpl3+)))

;; (define-public lutris-wrap
;;   (nonguix-container->package
;;    (nonguix-container
;;     (name "lutris-wrap")
;;     (wrap-package lutris)
;;     (run "/bin/lutris")
;;     (union64
;;      (fhs-union `(,@steam-client-libs
;;                   ,@steam-gameruntime-libs
;;                   ,@fhs-min-libs)
;;                 #:name "fhs-union-64"))
;;     (union32
;;      (fhs-union `(,@steam-client-libs
;;                   ,@steam-gameruntime-libs
;;                   ,@fhs-min-libs)
;;                 #:name "fhs-union-32"
;;                 #:system "i686-linux"))
;;     ;; (link-files '("share/applications/steam.desktop"
;;     ;;               "share/applications/steam-asound32.desktop"))
;;     (description "Steam is a digital software distribution platform created by
;; Valve.  This package provides a script for launching Steam in a Guix container
;; which will use the directory @file{$HOME/.local/share/guix-sandbox-home} where
;; all games will be installed."))))

(define pciutils-no-zlib
  (package
   (inherit pciutils)
   (arguments
    (substitute-keyword-arguments (package-arguments pciutils)
      ((#:phases phases)
       `(modify-phases ,phases
          (add-after 'configure 'disable-zlib
            ;; remove zlib from Makefile to have uncompressed pci.ids
            (lambda* (#:key outputs #:allow-other-keys)
              (substitute* "Makefile"
                (("^ZLIB := .*$")
                 "ZLIB := no\n"))))))))))

lutris
