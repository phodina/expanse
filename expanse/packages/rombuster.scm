(define-module (expanse packages rombuster)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (gnu packages graphviz)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:))

(define-public rombuster
  (package
    (name "rombuster")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	   (url "https://github.com/EntySec/RomBuster")
	   (commit version)))
       (sha256
        (base32
         "1pmshr2vvl22zr0d3fzh4xfjsqkcs8ikwy6mbnazrgggqfnb2by8"))))
    (build-system python-build-system)
	(arguments
	(list #:tests? #f
#:phases
	#~(modify-phases %standard-phases
	(delete 'sanity-check)))) ; no test suite
    (propagated-inputs (list python-shodan python-entrypoints))
    (home-page
     "https://github.com/smeggingsmegger/VeryPrettyTable")
    (synopsis
     "Router exploitation tool")
    (description "")
    (license license:expat)))

(define-public python-zoomeye
  (package
    (name "python-zoomeye")
    (version "2.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "zoomeye" version))
        (sha256
          (base32 "1cr052in31sq3kc4ds03i6qm55cm90yg9lmzq0y4zf77181w8c39"))))
    (build-system python-build-system)
	(arguments
	(list #:tests? #f)) ; requires network connection
    (propagated-inputs
      (list python-certifi21
            python-charset-normalizer-2
            python-colorama
            python-graphviz-0.19
            python-idna3
            python-requests
            python-urllib3))
    (home-page "https://github.com/knownsec/zoomeye-python")
    (synopsis
      "Python library and command-line tool for ZoomEye (https://www.zoomeye.org/doc)")
    (description
      "Python library and command-line tool for ZoomEye (https://www.zoomeye.org/doc)")
    (license #f)))

(define-public python-graphviz-0.19
  (package
    (inherit python-graphviz)
    (name "python-graphviz")
    (version "0.19")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "graphviz" version ".zip"))
        (sha256
          (base32
		  "1zcdprs60k9msmlym5vw0rm5ha5j2w6khkkz7d3sj93zqjhm89dl"))))))

(define-public python-charset-normalizer-2
  (package
    (inherit python-charset-normalizer)
    (name "python-charset-normalizer")
    (version "2.0.8")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "charset-normalizer" version))
        (sha256
          (base32
		  "1c0pm73vk5z23jbgdx19zjqnnlvyh5zdjlx4sy67f1l5k86j8pkk"))))))

(define-public python-certifi21
  (package
    (inherit python-certifi)
    (name "python-certifi")
    (version "2021.10.8")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "certifi" version))
        (sha256
          (base32
		  "0wl8ln7acd797i1q7mmb430l6hqwhmk4bd37x8ycw02b3my4x23q"))))))

(define-public python-idna3
  (package
    (inherit python-idna)
    (name "python-shodan")
    (version "3.3")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "idna" version))
        (sha256
          (base32
		  "0v8f6qjfi5i7qc5icsbv2pi24qy6k6m8wjqjvdf2sxjvlpq3yr4x"))))))

(define-public python-shodan
  (package
    (name "python-shodan")
    (version "1.27.0")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "shodan" version))
        (sha256
          (base32 "0l6mz03w6b6kiff65wmly336mz226kry1xzpkxx1cqqbw03ffjjy"))))
    (build-system python-build-system)
	(arguments
	(list #:tests? #f)) ; requires network connection
    (propagated-inputs
      (list python-click
            python-click-plugins
            python-colorama
            python-requests
            python-xlsxwriter))
    (home-page "https://github.com/achillean/shodan-python")
    (synopsis
      "Python library and command-line utility for Shodan (https://developer.shodan.io)")
    (description
      "Python library and command-line utility for Shodan (https://developer.shodan.io)")
    (license #f)))
