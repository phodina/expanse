;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2021 Petr Hodina <phodina@protonmail.com>
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

(define-module (expanse packages stylish)
  #:use-module (guix packages)
  #:use-module (guix build utils)
  #:use-module (gnu packages image-viewers)
  #:use-module (gnu packages xfce)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages web)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:))

(define-public stylish
 (package
  (name "stylish")
  (version "602f467e63b8ea2425fd67204521288712787a7e") ; no tags
  (source (origin
            (method git-fetch)
            (uri (git-reference
                   (url "https://github.com/thevinter/styli.sh")
                   (commit version)))
            (sha256
             (base32
              "147rhv46jvzppv8wivd3kmn9gdv70whfgp14992wzgjxlx6p7mrc"))))
  (build-system copy-build-system)
  (arguments
    `(#:install-plan '(("styli.sh" "bin/stylish.sh"))
      #:phases
      (modify-phases %standard-phases
        (add-after 'install 'wrap-jq
          (lambda* (#:key outputs #:allow-other-keys)
            (wrap-program (string-append (assoc-ref outputs "out") "/bin/stylish.sh")
			                    `("PATH" ":" prefix (,(string-append (assoc-ref %build-inputs "jq") "/bin")))))))))
  (inputs `(("feh" ,feh) ("jq" ,jq)))
  (synopsis "Wallpaper switching made easy")
  (description "Automate the tedious process of finding new wallpapers,
downloading and switching them via the configs.  Styli.sh can search for
specific wallpapers from unsplash or download a random image from the specified
subreddits.  If you have pywal it also can set automatically your terminal
colors.")
  (home-page "https://github.com/thevinter/styli.sh")
  (license license:expat))) ; MIT

;(define-public stylish-nitrogen
; (package
;   (inherit stylish
;   (name "stylish-nitrogen")
;   (inputs `(("nitrogen" ,nitrogen))))))
;
;(define-public stylish-xfce
; (package
;   (inherit stylish
;   (name "stylish-xfce")
;   (inputs `(("xfconf" ,xfconf) ("xrandr" ,xrandr))))))
;
;(define-public stylish-kde
; (package
;   (inherit stylish
;   (name "stylish-kde")
;   (inputs `(("kdbusaddons" ,kdbusaddons))))))
;
;(define-public stylish-gnome
; (package
;   (inherit stylish
;   (name "stylish-gnome")
;   (inputs `(("glib:bin" ,glib :bin))))))
;
;(define-public stylish-sway
; (package
;   (inherit stylish
;   (name "stylish-sway")
;   (inputs `(("swaybg" ,swaybg))))))
