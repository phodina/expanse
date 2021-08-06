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

(define-module (expanse packages colorscripts)
  #:use-module (guix packages)
  #:use-module (gnu packages ncurses)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:))

(define-public shell-color-scripts
 (package
  (name "colorscript")
  (version "3dbdfac24bb629238fdc3e1c8909e2c8577f8735") ; no tags
  (source (origin
            (method git-fetch)
            (uri (git-reference
                   (url "https://gitlab.com/dwt1/shell-color-scripts")
                   (commit version)))
            (sha256
             (base32
              "0lkiz6fkrqryr1vh0lh067q7hp8ba8887pkk8caipqphjswp2z16"))))
  (build-system copy-build-system)
  (arguments
    `(#:install-plan '(("colorscript.sh" "bin/colorscript.sh")
                       ("colorscripts" "colorscripts"))
      #:phases
      (modify-phases %standard-phases
        (add-after 'unpack 'fix-colorscipts-location
          (lambda* (#:key outputs #:allow-other-keys)
            (substitute* "colorscript.sh"
              (("/opt/shell-color-scripts/colorscripts")
               (string-append (assoc-ref outputs "out") "/colorscripts"))))))))
  ;TODO: License + autocomplete
  (inputs `(("ncurses" ,ncurses)))
  (synopsis "Collection of terminal color scripts")
  (description "Collection of terminal color scripts")
  (home-page "https://gitlab.com/dwt1/shell-color-scripts")
  (license license:expat))) ; MIT
