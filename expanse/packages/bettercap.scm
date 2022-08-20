(define-module (expanse packages bettercap)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages syncthing)
  #:use-module (guix build-system go)
  #:use-module ((guix licenses) #:prefix license:))

(define-public go-github-com-acarl005-stripansi
  (package
    (name "go-github-com-acarl005-stripansi")
    (version "0.0.0-20180116102854-5a71ef0e047d")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/acarl005/stripansi")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "02sxiishdixm791jqbkmhdcvc712l0fb8rqmibxzgc61h0qs6rs3"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/acarl005/stripansi"))
    (home-page "https://github.com/acarl005/stripansi")
    (synopsis "Strip ANSI")
    (description "This Go package removes ANSI escape codes from strings.")
    (license license:expat)))

(define-public go-github-com-adrianmo-go-nmea
  (package
    (name "go-github-com-adrianmo-go-nmea")
    (version "1.6.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/adrianmo/go-nmea")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "06l4v7rpxy1lhhllip96ayjs0z8flnj9fyp00f29kx4xy5rvn6kw"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/adrianmo/go-nmea"))
    (propagated-inputs
      `(("go-github-com-stretchr-testify" ,go-github-com-stretchr-testify)
        ("go-github-com-davecgh-go-spew" ,go-github-com-davecgh-go-spew)))
    (home-page "https://github.com/adrianmo/go-nmea")
    (synopsis "go-nmea")
    (description
      "This is a NMEA library for the Go programming language (Golang).")
    (license license:expat)))

(define-public go-github-com-antchfx-jsonquery
  (package
    (name "go-github-com-antchfx-jsonquery")
    (version "1.1.5")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/antchfx/jsonquery")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0lc50519iwhkrasgyby1c1i8p3195fkx929af7lkkw58zjk5yb7w"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/antchfx/jsonquery"))
    (propagated-inputs
      `(("go-github-com-golang-groupcache" ,go-github-com-golang-groupcache)
        ("go-github-com-antchfx-xpath" ,go-github-com-antchfx-xpath)))
    (home-page "https://github.com/antchfx/jsonquery")
    (synopsis "jsonquery")
    (description
      "jsonquery is an XPath query package for JSON document, lets you extract data
from JSON documents through an XPath expression.  Built-in XPath expression
cache avoid re-compile XPath expression each query.")
    (license license:expat)))

(define-public go-github-com-antchfx-xpath
  (package
    (name "go-github-com-antchfx-xpath")
    (version "1.2.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/antchfx/xpath")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "1qidxka248aaqf8n3m04ig25skgaxzh2ahm75swwxsk3s198lg08"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/antchfx/xpath"))
    (home-page "https://github.com/antchfx/xpath")
    (synopsis "XPath")
    (description
      "XPath is Go package provides selecting nodes from XML, HTML or other documents
using XPath expression.")
    (license license:expat)))

(define-public go-github-com-mgutz-logxi
  (package
    (name "go-github-com-mgutz-logxi")
    (version "0.0.0-20161027140823-aebf8a7d67ab")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/mgutz/logxi")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "1f8sqibkzz9wfplvvblz9s0xvvmhkd2af8ghcsmjw8818gcrzsqx"))))
    (build-system go-build-system)
    (arguments '(
	#:tests? #f
	#:import-path "github.com/mgutz/logxi/v1"
    #:unpack-path "github.com/mgutz/logxi"))
    (native-inputs
      `(("go-github-com-stretchr-testify"
	  ,go-github-com-stretchr-testify)))
    (propagated-inputs `(("go-github-com-mgutz-ansi"
	,go-github-com-mgutz-ansi)
        ("go-github-com-mattn-go-colorable"
		,go-github-com-mattn-go-colorable)
        ("go-github-com-mattn-go-isatty" ,go-github-com-mattn-go-isatty)))
    (home-page "https://github.com/mgutz/logxi")
    (synopsis "logxi")
    (description
      "log XI is a structured @url{http://12factor.net/logs,12-factor app} logger built
for speed and happy development.")
    (license license:expat)))

(define-public go-github-com-bettercap-gatt
  (package
    (name "go-github-com-bettercap-gatt")
    (version "0.0.0-20210514133428-df6e615f2f67")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/bettercap/gatt")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "13xr2gs31pxwcd021xwgwz6iv38hdxn6wp5yg2qs2p8rm5fvgp0l"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/bettercap/gatt"))
    (propagated-inputs
      `(("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
        ("go-gopkg-in-check-v1" ,go-gopkg-in-check-v1)
        ("go-golang-org-x-sys" ,go-golang-org-x-sys)
        ("go-github-com-stretchr-testify" ,go-github-com-stretchr-testify)
        ("go-github-com-mgutz-logxi" ,go-github-com-mgutz-logxi)
        ("go-github-com-mgutz-ansi" ,go-github-com-mgutz-ansi)
        ("go-github-com-mattn-go-colorable" ,go-github-com-mattn-go-colorable)
        ("go-github-com-kr-text" ,go-github-com-kr-text)
        ("go-github-com-davecgh-go-spew" ,go-github-com-davecgh-go-spew)))
    (home-page "https://github.com/bettercap/gatt")
    (synopsis
      "Package gatt provides a Bluetooth Low Energy GATT implementation.")
    (description
      "Package gatt provides a Bluetooth Low Energy gatt implementation.")
    (license license:bsd-3)))

(define-public go-github-com-bettercap-nrf24
  (package
    (name "go-github-com-bettercap-nrf24")
    (version "0.0.0-20190219153547-aa37e6d0e0eb")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/bettercap/nrf24")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "1y6ffcj94hk7slajqw3lqpdxzx6iqpj2i2zpsvggg6kfaa1iklnj"))))
    (build-system go-build-system)
	(native-inputs (list pkg-config))
	(inputs (list libusb))
    (arguments '(#:import-path "github.com/bettercap/nrf24"))
    (propagated-inputs
      `(("go-github-com-google-gousb" ,go-github-com-google-gousb)))
    (home-page "https://github.com/bettercap/nrf24")
    (synopsis "NRF24")
    (description
      "Package nrf24 allows interaction with nRF24LU1+ based dongles and RFStorm
firmware.  Ref.
@url{https://github.com/BastilleResearch/nrf-research-firmware,https://github.com/BastilleResearch/nrf-research-firmware}")
    (license license:gpl3)))

(define-public go-github-com-bettercap-readline
  (package
    (name "go-github-com-bettercap-readline")
    (version "0.0.0-20210228151553-655e48bcb7bf")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/bettercap/readline")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "185r0jh4280bv2kjyb6g6siza1s75nvckslzzxgcvdbd3kf239ar"))))
    (build-system go-build-system)
    (arguments
	 `(#:tests? #f
	   #:import-path "github.com/bettercap/readline"))
    (home-page "https://github.com/bettercap/readline")
    (synopsis "Guide")
    (description
      "Readline is a pure go implementation for GNU-Readline kind library.")
    (license license:expat)))

(define-public go-github-com-bettercap-recording
  (package
    (name "go-github-com-bettercap-recording")
    (version "0.0.0-20190408083647-3ce1dcf032e3")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/bettercap/recording")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "1arh12iz15anyrqr4q496lpd0gx5nf2cwyr5rv17rawqqz8ydg23"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/bettercap/recording"))
    (native-inputs `(("go-github-com-kr-binarydist" ,go-github-com-kr-binarydist)))
    (propagated-inputs
      `(("go-github-com-evilsocket-islazy"
	  ,go-github-com-evilsocket-islazy)))
    (home-page "https://github.com/bettercap/recording")
    (synopsis "Example")
    (description
      "Package recording allows writing and reading of bettercap's session recordings.")
    (license license:gpl3)))

(define-public go-github-com-chifflier-nfqueue-go
  (package
    (name "go-github-com-chifflier-nfqueue-go")
    (version "0.0.0-20170228160439-61ca646babef")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/chifflier/nfqueue-go")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "1i1q2xl86f3s9x3j2ffxprwqhcrkh4w23hh4ib7jksxvaq36v33l"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/chifflier/nfqueue-go/nfqueue"
#:unpack-path "github.com/chifflier/nfqueue-go"
#:phases
	(modify-phases %standard-phases
	(add-after 'unpack 'fix-netfiler-lib-name
	 (lambda* _
	  (substitute* "github.com/chifflier/nfqueue-go/nfqueue/nfqueue.go"
	  (("libnetfilter_queue") "libnfnetlink")))))))
	(native-inputs (list pkg-config))
	(inputs (list libnfnetlink))
    (home-page "https://github.com/chifflier/nfqueue-go")
    (synopsis "nfqueue-go")
    (description
      "nfqueue-go is a wrapper library for
@url{http://www.netfilter.org/projects/libnetfilter_queue/,libnetfilter-queue}.
The goal is to provide a library to gain access to packets queued by the kernel
packet filter.")
    (license license:gpl2)))

(define-public go-github-com-elazarl-goproxy
  (package
    (name "go-github-com-elazarl-goproxy")
    (version "0.0.0-20220115173737-adb46da277ac")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/elazarl/goproxy")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "1q81mnvaiqja16i3aak05vy9sl7d8qa1xyz8q52x7l8gh4g886h1"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/elazarl/goproxy"
    #:import-path "github.com/elazarl/goproxy"))
    (propagated-inputs
      `(("go-github-com-elazarl-goproxy-ext"
         ,go-github-com-elazarl-goproxy-ext)))
    (home-page "https://github.com/elazarl/goproxy")
    (synopsis "Introduction")
    (description
      "Taken from $GOROOT/src/pkg/net/http/chunked needed to write https responses to
client.")
    (license license:bsd-3)))

(define-public go-github-com-rogpeppe-go-charset
  (package
    (name "go-github-com-rogpeppe-go-charset")
    (version "0.0.0-20190617161244-0dc95cdf6f31")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/rogpeppe/go-charset")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0da0q9j6c98ra29i1jrlw2jdfrm046s4rs9qchh1l4jjrpq6bicr"))))
    (build-system go-build-system)
    (arguments '(
    #:tests? #f
	#:import-path "github.com/rogpeppe/go-charset/charset"
    #:unpack-path "github.com/rogpeppe/go-charset"))
    (home-page "https://github.com/rogpeppe/go-charset")
    (synopsis "THIS PACKAGE IS NO LONGER MAINTAINED.")
    (description
      "Use
@url{https://godoc.org/golang.org/x/text/transform,golang.org/x/text/transform}
instead.")
    (license license:bsd-2)))

(define-public go-github-com-elazarl-goproxy-ext
  (package
    (name "go-github-com-elazarl-goproxy-ext")
    (version "0.0.0-20220115173737-adb46da277ac")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/elazarl/goproxy")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "1q81mnvaiqja16i3aak05vy9sl7d8qa1xyz8q52x7l8gh4g886h1"))))
    (build-system go-build-system)
    (arguments
      '(#:tests? #f
	    #:import-path
        "github.com/elazarl/goproxy"
        #:unpack-path
        "github.com/elazarl/goproxy"))
    (propagated-inputs
      `(("go-github-com-rogpeppe-go-charset"
         ,go-github-com-rogpeppe-go-charset)))
    (home-page "https://github.com/elazarl/goproxy")
    (synopsis #f)
    (description #f)
    (license license:bsd-3)))

(define-public go-github-com-evilsocket-islazy
  (package
    (name "go-github-com-evilsocket-islazy")
    (version "1.10.6")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/evilsocket/islazy")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "15gsazai93xqn61jl1zmrdf88s0mjxkqqpz95vgj7vm4hakybg6q"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/evilsocket/islazy"))
    (propagated-inputs
      `(("go-github-com-robertkrimen-otto"
	  ,go-github-com-robertkrimen-otto)))
    (home-page "https://github.com/evilsocket/islazy")
    (synopsis "Who's using islazy?")
    (description
      "@code{islazy} is a Go library containing a set of
@url{https://stackoverflow.com/questions/802050/what-is-opinionated-software,opinionated}
packages, objects, helpers and functions implemented with the
@url{https://en.wikipedia.org/wiki/KISS_principle,KISS principle} in mind that I
often use in my projects.")
    (license license:gpl3)))

(define-public go-github-com-golang-groupcache
  (package
    (name "go-github-com-golang-groupcache")
    (version "0.0.0-20210331224755-41bb18bfe9da")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/golang/groupcache")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "07amgr8ji4mnq91qbsw2jlcmw6hqiwdf4kzfdrj8c4b05w4knszc"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/golang/groupcache"))
    (propagated-inputs `(("go-github-com-golang-protobuf-proto"
	,go-github-com-golang-protobuf-proto)))
    (home-page "https://github.com/golang/groupcache")
    (synopsis "groupcache")
    (description
      "Package groupcache provides a data loading mechanism with caching and
de-duplication that works across a set of peer processes.")
    (license license:asl2.0)))

(define-public go-github-com-google-go-cmp
  (package
    (name "go-github-com-google-go-cmp")
    (version "0.5.7")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/google/go-cmp")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "19yipyfhsrxnksx9imj05qdrd8bmij27isw8lgm5p6xin34hxi0m"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/google/go-cmp/cmp"
    #:unpack-path "github.com/google/go-cmp"))
    (propagated-inputs `(("go-golang-org-x-xerrors" ,go-golang-org-x-xerrors)))
    (home-page "https://github.com/google/go-cmp")
    (synopsis "Package for equality of Go values")
    (description
      "This package is intended to be a more powerful and safer alternative to
@code{reflect.DeepEqual} for comparing whether two values are semantically
equal.")
    (license license:bsd-3)))

(define-public go-github-com-google-gopacket
  (package
    (name "go-github-com-google-gopacket")
    (version "1.1.19")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/google/gopacket")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "048qwm2n0wrpql4qqgd7jyynn3gk069yvqbxnshlayzmbhf87ls4"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/google/gopacket"))
    (propagated-inputs
      `(("go-golang-org-x-sys" ,go-golang-org-x-sys)
        ("go-golang-org-x-net" ,go-golang-org-x-net)
        ("go-golang-org-x-lint" ,go-golang-org-x-lint)))
    (home-page "https://github.com/google/gopacket")
    (synopsis "GoPacket")
    (description
      "Package gopacket provides packet decoding for the Go language.")
    (license license:bsd-3)))

(define-public go-github-com-google-gousb
  (package
    (name "go-github-com-google-gousb")
    (version "1.1.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/google/gousb")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "1sb3m97ddcw6imr7jspncmviyj08l5fxk87irip7kq6pmj9ln3la"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/google/gousb"))
	(native-inputs (list pkg-config))
	(inputs (list libusb))
    (home-page "https://github.com/google/gousb")
    (synopsis "Introduction")
    (description
      "Package gousb provides an low-level interface to attached USB devices.")
    (license license:asl2.0)))

(define-public go-github-com-gorilla-websocket
  (package
    (name "go-github-com-gorilla-websocket")
    (version "1.5.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/gorilla/websocket")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "1xrr6snvs9g1nzxxg05w4i4pq6k1xjljl5mvavd838qc468n118i"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/gorilla/websocket"))
    (home-page "https://github.com/gorilla/websocket")
    (synopsis "Gorilla WebSocket")
    (description
      "Package websocket implements the WebSocket protocol defined in
@url{https://rfc-editor.org/rfc/rfc6455.html,RFC 6455}.")
    (license license:bsd-2)))

(define-public go-github-com-hashicorp-mdns
  (package
    (name "go-github-com-hashicorp-mdns")
    (version "1.0.5")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/hashicorp/mdns")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0i8ly6ixbfjy5gf8irdlda1p3314b2yzn9fxzkajm2bw348mfbfi"))))
    (build-system go-build-system)
    (arguments '(
#:tests? #f
	#:import-path "github.com/hashicorp/mdns"))
    (propagated-inputs
      `(("go-golang-org-x-net" ,go-golang-org-x-net)
        ("go-github-com-miekg-dns" ,go-github-com-miekg-dns)))
    (home-page "https://github.com/hashicorp/mdns")
    (synopsis "mdns")
    (description
      "Simple mDNS client/server library in Golang.  mDNS or Multicast DNS can be used
to discover services on the local network without the use of an authoritative
DNS server.  This enables peer-to-peer discovery.  It is important to note that
many networks restrict the use of multicasting, which prevents mDNS from
functioning.  Notably, multicast cannot be used in any sort of cloud, or shared
infrastructure environment.  However it works well in most office, home, or
private infrastructure environments.")
    (license license:expat)))

(define-public go-github-com-inconshreveable-go-vhost
  (package
    (name "go-github-com-inconshreveable-go-vhost")
    (version "0.0.0-20160627193104-06d84117953b")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/inconshreveable/go-vhost")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0wliilsybm7xf5h685a23rsm8bnlhkr332pkdkhf32q16sr1a9rk"))))
    (build-system go-build-system)
    (arguments
	`(#:tests? #f
	  #:import-path "github.com/inconshreveable/go-vhost"))
    (home-page "https://github.com/inconshreveable/go-vhost")
    (synopsis "go-vhost")
    (description
      "go-vhost is a simple library that lets you implement virtual hosting
functionality for different protocols (HTTP and TLS so far).  go-vhost has a
high-level and a low-level interface.  The high-level interface lets you wrap
existing net.Listeners with \"muxer\" objects.  You can then Listen() on a muxer
for a particular virtual host name of interest which will return to you a
net.Listener for just connections with the virtual hostname of interest.")
    (license license:asl2.0)))

(define-public go-github-com-jpillora-go-tld
  (package
    (name "go-github-com-jpillora-go-tld")
    (version "1.1.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/jpillora/go-tld")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0m1p8bckxd0fn13irmz5bmy7bl9bnh8ycki15zxqi8xsrargj7jd"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/jpillora/go-tld"))
    (propagated-inputs `(("go-golang-org-x-net" ,go-golang-org-x-net)))
    (home-page "https://github.com/jpillora/go-tld")
    (synopsis "TLD Parser in Go")
    (description
      "Package tld has the same API as net/url except tld.URL contains extra fields:
Subdomain, Domain, TLD and Port.")
    (license license:expat)))

(define-public go-github-com-koppacetic-go-gpsd
  (package
    (name "go-github-com-koppacetic-go-gpsd")
    (version "0.4.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/koppacetic/go-gpsd")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "18kghfx5blnynqyr3y3krq39cbap1jzdc4xa1lch4lngwwamc3ca"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/koppacetic/go-gpsd"))
    (home-page "https://github.com/koppacetic/go-gpsd")
    (synopsis #f)
    (description #f)
    (license #f)))

(define-public go-github-com-kr-binarydist
  (package
    (name "go-github-com-kr-binarydist")
    (version "0.1.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/kr/binarydist")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0hz1yqlxmkdib8xsdkkvn4ian4i69jmfapadim9fhj632d6jpi7w"))))
    (build-system go-build-system)
    (arguments
	'(#:tests? #f
	  #:import-path "github.com/kr/binarydist"))
    (home-page "https://github.com/kr/binarydist")
    (synopsis "binarydist")
    (description
      "Package binarydist implements binary diff and patch as described on
@url{http://www.daemonology.net/bsdiff/,http://www.daemonology.net/bsdiff/}.  It
reads and writes files compatible with the tools there.")
    (license license:expat)))

(define-public go-github-com-malfunkt-iprange
  (package
    (name "go-github-com-malfunkt-iprange")
    (version "0.9.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/malfunkt/iprange")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0gv5w678r74jval675xp0y1hzpf7mm5m9apa1rz9krxc9zd0ycr8"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/malfunkt/iprange"))
	(native-inputs `(("go-github-com-stretchr-testify"
	,go-github-com-stretchr-testify))) 
    (propagated-inputs `(("go-github-com-pkg-errors"
	,go-github-com-pkg-errors)))
    (home-page "https://github.com/malfunkt/iprange")
    (synopsis "iprange")
    (description
      "@code{iprange} is a library you can use to parse IPv4 addresses from a string in
the @code{nmap} format.")
    (license license:expat)))

(define-public go-github-com-mdlayher-dhcp6
  (package
    (name "go-github-com-mdlayher-dhcp6")
    (version "0.0.0-20190311162359-2a67805d7d0b")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/mdlayher/dhcp6")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0xn7canpik3lrz73dcz4jzapq1bfxpnashvjvnvshcpa2n1lh8yw"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/mdlayher/dhcp6"))
    (propagated-inputs `(("go-golang-org-x-net" ,go-golang-org-x-net)))
    (home-page "https://github.com/mdlayher/dhcp6")
    (synopsis "dhcp6")
    (description
      "Package dhcp6 implements a DHCPv6 server, as described in
@url{https://rfc-editor.org/rfc/rfc3315.html,RFC 3315}.")
    (license license:expat)))

(define-public go-github-com-miekg-dns
  (package
    (name "go-github-com-miekg-dns")
    (version "1.1.46")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/miekg/dns")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "135hnwz3gphgdhs3cs07bvlvbc8k5lh3a75nwkyvl3ylnlf0mpnp"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/miekg/dns"))
    (propagated-inputs
      `(("go-golang-org-x-tools" ,go-golang-org-x-tools)
        ("go-golang-org-x-sys" ,go-golang-org-x-sys)
        ("go-golang-org-x-sync" ,go-golang-org-x-sync)
        ("go-golang-org-x-net" ,go-golang-org-x-net)))
    (home-page "https://github.com/miekg/dns")
    (synopsis "Alternative (more granular) approach to a DNS library")
    (description
      "Package dns implements a full featured interface to the Domain Name System.
Both server- and client-side programming is supported.  The package allows
complete control over what is sent out to the DNS.  The API follows the
less-is-more principle, by presenting a small, clean interface.")
    (license license:bsd-3)))

(define-public go-github-com-chzyer-logex
  (package
    (name "go-github-com-chzyer-logex")
    (version "1.2.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/chzyer/logex")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "07ksz43a8kvx0hm8qji6kb1xm7fbwmwapcvcq9zpc8v337jggs4g"))))
    (build-system go-build-system)
    (arguments
	`(#:tests? #f
	  #:import-path "github.com/chzyer/logex"))
    (home-page "https://github.com/chzyer/logex")
    (synopsis "Logex")
    (description
      "An golang log lib, supports tracing and level, wrap by standard log lib")
    (license license:expat)))

(define-public go-github-com-chzyer-test
  (package
    (name "go-github-com-chzyer-test")
    (version "0.0.0-20210722231415-061457976a23")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/chzyer/test")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "1jjskijacwzz0qxzrbwsglpg5vil7v4xaq8l40r2fhd2icl9hz7a"))))
    (build-system go-build-system)
    (arguments
	`(#:tests? #f
	  #:import-path "github.com/chzyer/test"))
    (propagated-inputs
      `(("go-github-com-chzyer-logex" ,go-github-com-chzyer-logex)))
    (home-page "https://github.com/chzyer/test")
    (synopsis "test")
    (description #f)
    (license license:expat)))

(define-public go-gopkg-in-readline-v1
  (package
    (name "go-gopkg-in-readline-v1")
    (version "1.0.0-20160726135117-62c6fe619375")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://gopkg.in/readline.v1")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "1qd2qhjps26x4pin2614w732giy89p22b2qww4wg15zz5g2365nk"))))
    (build-system go-build-system)
    (arguments
      '(#:import-path
        "gopkg.in/readline.v1"
        #:unpack-path
        "gopkg.in/readline.v1"))
    (native-inputs `(("go-github-com-chzyer-test" ,go-github-com-chzyer-test)))
    (home-page "https://gopkg.in/readline.v1")
    (synopsis "readline")
    (description
      "Readline is a pure go implementation for GNU-Readline kind library.")
    (license license:expat)))

(define-public go-github-com-robertkrimen-otto
  (package
    (name "go-github-com-robertkrimen-otto")
    (version "0.0.0-20211024170158-b87d35c0b86f")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/robertkrimen/otto")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "05aghmn33rk3af3fp517lwg0ini2fnrddr3si0c5cgz7iz126nwx"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/robertkrimen/otto"))
    (propagated-inputs
      `(("go-gopkg-in-sourcemap-v1" ,go-gopkg-in-sourcemap-v1)
        ("go-gopkg-in-readline-v1" ,go-gopkg-in-readline-v1)
        ("go-github-com-stretchr-testify" ,go-github-com-stretchr-testify)
        ("go-github-com-chzyer-test" ,go-github-com-chzyer-test)
        ("go-github-com-chzyer-logex" ,go-github-com-chzyer-logex)))
    (home-page "https://github.com/robertkrimen/otto")
    (synopsis "otto")
    (description
      "Package otto is a JavaScript parser and interpreter written natively in Go.")
    (license license:expat)))

(define-public go-github-com-tarm-serial
  (package
    (name "go-github-com-tarm-serial")
    (version "0.0.0-20180830185346-98f6abe2eb07")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/tarm/serial")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "1yj4jiv2f3x3iawxdflrlmdan0k9xsbnccgc9yz658rmif1ag3pb"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/tarm/serial"))
	(propagated-inputs `(("go-golang-org-x-sys" ,go-golang-org-x-sys)))
    (home-page "https://github.com/tarm/serial")
    (synopsis "Serial")
    (description
      "Goserial is a simple go package to allow you to read and write from the serial
port as a stream of bytes.")
    (license license:bsd-3)))

(define-public go-github-com-thoj-go-ircevent
  (package
    (name "go-github-com-thoj-go-ircevent")
    (version "0.0.0-20210723090443-73e444401d64")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/thoj/go-ircevent")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0mhdbl2y4bpiyv0d3dbnvvdxnb53aqxs64cff13nw33sl6ajc1l3"))))
    (build-system go-build-system)
    (arguments '(
    #:tests? #f ; timeout
	#:import-path "github.com/thoj/go-ircevent"))
    (propagated-inputs
      `(("go-golang-org-x-text" ,go-golang-org-x-text)
        ("go-golang-org-x-net" ,go-golang-org-x-net)))
    (home-page "https://github.com/thoj/go-ircevent")
    (synopsis "Description")
    (description "Event based irc client library.")
    (license license:bsd-3)))

(define-public go-gopkg-in-sourcemap-v1
  (package
    (name "go-gopkg-in-sourcemap-v1")
    (version "1.0.5")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://gopkg.in/sourcemap.v1")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "08rf2dl13hbnm3fq2cm0nnsspy9fhf922ln23cz5463cv7h62as4"))))
    (build-system go-build-system)
    (arguments
      '(#:tests? #f
	    #:import-path
        "gopkg.in/sourcemap.v1"
        #:unpack-path
        "gopkg.in/sourcemap.v1"))
    (home-page "https://gopkg.in/sourcemap.v1")
    (synopsis "Source Maps consumer for Golang")
    (description "Install:")
    (license license:bsd-2)))

(define-public bettercap
  (package
    (name "bettercap")
    (version "0.0.0-20211129094305-ed4239fad528")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/bettercap/bettercap")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0ip658rjv5czc8rhcrag4qw1m7sdddaaharxg3jaasxym0gwx117"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/bettercap/bettercap"))
    (propagated-inputs
      `(("go-gopkg-in-sourcemap-v1" ,go-gopkg-in-sourcemap-v1)
        ("go-golang-org-x-xerrors" ,go-golang-org-x-xerrors)
        ("go-golang-org-x-text" ,go-golang-org-x-text)
        ("go-golang-org-x-sys" ,go-golang-org-x-sys)
        ("go-golang-org-x-net" ,go-golang-org-x-net)
        ("go-github-com-thoj-go-ircevent" ,go-github-com-thoj-go-ircevent)
        ("go-github-com-tarm-serial" ,go-github-com-tarm-serial)
        ("go-github-com-robertkrimen-otto" ,go-github-com-robertkrimen-otto)
        ("go-github-com-pkg-errors" ,go-github-com-pkg-errors)
        ("go-github-com-mitchellh-go-homedir"
         ,go-github-com-mitchellh-go-homedir)
        ("go-github-com-miekg-dns" ,go-github-com-miekg-dns)
        ("go-github-com-mdlayher-dhcp6" ,go-github-com-mdlayher-dhcp6)
        ("go-github-com-mattn-go-isatty" ,go-github-com-mattn-go-isatty)
        ("go-github-com-malfunkt-iprange" ,go-github-com-malfunkt-iprange)
        ("go-github-com-kr-binarydist" ,go-github-com-kr-binarydist)
        ("go-github-com-koppacetic-go-gpsd" ,go-github-com-koppacetic-go-gpsd)
        ("go-github-com-jpillora-go-tld" ,go-github-com-jpillora-go-tld)
        ("go-github-com-inconshreveable-go-vhost"
         ,go-github-com-inconshreveable-go-vhost)
        ("go-github-com-hashicorp-mdns" ,go-github-com-hashicorp-mdns)
        ("go-github-com-gorilla-websocket" ,go-github-com-gorilla-websocket)
        ("go-github-com-gorilla-mux" ,go-github-com-gorilla-mux)
        ("go-github-com-google-gousb" ,go-github-com-google-gousb)
        ("go-github-com-google-gopacket" ,go-github-com-google-gopacket)
        ("go-github-com-google-go-querystring"
         ,go-github-com-google-go-querystring)
        ("go-github-com-google-go-github" ,go-github-com-google-go-github)
        ("go-github-com-google-go-cmp" ,go-github-com-google-go-cmp)
        ("go-github-com-golang-groupcache" ,go-github-com-golang-groupcache)
        ("go-github-com-gobwas-glob" ,go-github-com-gobwas-glob)
        ("go-github-com-evilsocket-islazy" ,go-github-com-evilsocket-islazy)
;        ("go-github-com-elazarl-goproxy-ext"
;         ,go-github-com-elazarl-goproxy-ext)
;        ("go-github-com-elazarl-goproxy" ,go-github-com-elazarl-goproxy)
        ("go-github-com-dustin-go-humanize" ,go-github-com-dustin-go-humanize)
        ("go-github-com-chzyer-test" ,go-github-com-chzyer-test)
        ("go-github-com-chzyer-logex" ,go-github-com-chzyer-logex)
        ("go-github-com-chifflier-nfqueue-go"
         ,go-github-com-chifflier-nfqueue-go)
        ("go-github-com-bettercap-recording"
         ,go-github-com-bettercap-recording)
        ("go-github-com-bettercap-readline" ,go-github-com-bettercap-readline)
        ("go-github-com-bettercap-nrf24" ,go-github-com-bettercap-nrf24)
        ("go-github-com-bettercap-gatt" ,go-github-com-bettercap-gatt)
        ("go-github-com-antchfx-xpath" ,go-github-com-antchfx-xpath)
        ("go-github-com-antchfx-jsonquery" ,go-github-com-antchfx-jsonquery)
        ("go-github-com-adrianmo-go-nmea" ,go-github-com-adrianmo-go-nmea)
        ("go-github-com-acarl005-stripansi"
         ,go-github-com-acarl005-stripansi)))
    (home-page "https://github.com/bettercap/bettercap")
    (synopsis "Main Features")
    (description
      "bettercap is a powerful, easily extensible and portable framework written in Go
which aims to offer to security researchers, red teamers and reverse engineers
an @strong{easy to use}, @strong{all-in-one solution} with all the features they
might possibly need for performing reconnaissance and attacking
@url{https://www.bettercap.org/modules/wifi/,WiFi} networks,
@url{https://www.bettercap.org/modules/ble/,Bluetooth Low Energy} devices,
wireless @url{https://www.bettercap.org/modules/hid/,HID} devices and
@url{https://www.bettercap.org/modules/ethernet,Ethernet} networks.")
    (license license:gpl3)))
