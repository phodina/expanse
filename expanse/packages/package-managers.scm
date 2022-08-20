;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2022 Petr Hodina <phodina@protonmail.com>
;;;
;;; This file is part of GNU Guix.
;;;
;;; GNU Guix is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; GNU Guix is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Guix.  If not, see <http://www.gnu.org/licenses/>.

(define-module (expanse packages package-managers)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix utils)
  #:use-module (guix build-system meson)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages docbook)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages polkit)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages valgrind)
  #:use-module (gnu packages xml))

(define-public gnome-software-center
  (package
    (name "gnome-software-center")
    (version "42.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                     (url "https://gitlab.gnome.org/GNOME/gnome-software")
                     (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0g5xvlxpknzzvyb1ppdlmf2pb1616dmzxdsi01rqlnk4djax5ar0"))))
    (build-system meson-build-system)
    (arguments
     (list ;#:configure-flags '("-Dfwupd=false" "-Dflatpak=false")
       #:tests? #f
       #:glib-or-gtk? #t))
    (native-inputs
     (list cmake
       desktop-file-utils
       docbook-xml
       docbook-xsl
       gettext-minimal
       `(,glib "bin")
       gtk-doc
       `(,gtk+ "bin")
       libxslt ; for xsltproc
       pkg-config
       valgrind))
    (inputs
     (list appstream-glib
       gnome-desktop
       `(,gnome-online-accounts "lib")
       gspell
       json-glib
       libarchive
       libgudev
       libsoup
       libxmlb
       packagekit
       polkit))
    (home-page "https://gitlab.gnome.org/GNOME/gnome-software")
    (synopsis "")
    (description "")
    (license #f)))

