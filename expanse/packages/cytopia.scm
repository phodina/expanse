(define-module (expanse packages cytopia)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages image)
  #:use-module (gnu packages toolkits)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:))

(define-public cytopia
(let ((commit "6631682e9e7c6341a7607683aee62b9bafa22230")
      (revision "1"))
  (package
    (name "cytopia")
    (version "0.2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/CytopiaTeam/Cytopia")
	   (commit commit)))
       (sha256
        (base32
         "1rpkj9si121vxq9vy7b32b3zghh1zjf186ba4yqi99amkh7fa6ij"))))
    (build-system cmake-build-system)
	(inputs (list sdl2
	sdl2-ttf
	sdl2-image
	openal
	zlib
;libnoise
libogg
libvorbis
libpng
imgui
	))
    (home-page "https://www.cytopia.net/")
    (synopsis "City building simulation game")
    (description "Cytopia is retro pixel-art city building game with a big
focus on mods.  It utilizes a custom isometric rendering engine based on
SDL2.")
    (license license:gpl3+))))
