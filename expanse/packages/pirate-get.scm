(define-module (expanse packages pirate-get)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages python-xyz)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:))

(define-public python-veryprettytable
  (package
    (name "python-veryprettytable")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "veryprettytable" version))
       (sha256
        (base32
         "1k1rifz8x6qcicmx2is9vgxcj0qb2f5pvzrp7zhmvbmci3yack3f"))))
    (build-system python-build-system)
    (propagated-inputs
     `(("python-colorama" ,python-colorama)
       ("python-termcolor" ,python-termcolor)))
    (home-page
     "https://github.com/smeggingsmegger/VeryPrettyTable")
    (synopsis
     "Visually appealing ASCII table output format for Python")
    (description
     "VeryPrettyTable is a Python library for displaying tabular data in a
visually appealing ASCII or HTML table.  Output is highly configurable,
including text alignment, padding, borders, sort order, and more.  Data can be
inserted directly, read from a CSV file, or imported using a Python DB-API
database cursor such as @code{sqlite3}.")
    (license license:bsd-3)))

(define-public python-pirate-get
  (package
    (name "python-pirate-get")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pirate-get" version))
       (sha256
        (base32
         "07s5ss9dxccx1mip7pyga1fagywkqchxmzz55ng47ac9053ffxkq"))))
    (build-system python-build-system)
    (inputs
     `(("python-colorama" ,python-colorama)
       ("python-pyperclip" ,python-pyperclip)
       ("python-veryprettytable" ,python-veryprettytable)))
    (home-page
     "https://github.com/vikstrous/pirate-get")
    (synopsis
     "Command line interface for The Pirate Bay")
    (description
     "@code{pirate-get} is an unofficial command line interface for searching
The Pirate Bay, inspired by @command{apt}.  Results can be saved as JSON,
@code{.torrent} files, or magnet links, or they can be opened directly in
@command{transmission-remote}.  @code{pirate-get} also supports searching
mirrors or a local copy of The Pirate Bay's database.")
    (license license:agpl3)))
