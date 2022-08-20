(define-module (expanse packages android)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix gexp)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (gnu packages golang)
  #:use-module (guix build-system go)
  #:use-module ((guix licenses) #:prefix license:))

(define-public go-github-com-spencercw-go-xz
  (package
    (name "go-github-com-spencercw-go-xz")
    (version "0.0.0-20181128201811-c82a2123b492")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/spencercw/go-xz")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0f5cm8bznjgwq51xqfxpwzp7k57hj7b0dcp0lq6kzik4qqzm1rhy"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/spencercw/go-xz"))
    (home-page "https://github.com/spencercw/go-xz")
    (synopsis #f)
    (description #f)
    (license #f)))

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

(define-public go-github-com-vbauerster-mpb-v5
  (package
    (name "go-github-com-vbauerster-mpb-v5")
    (version "5.4.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/vbauerster/mpb")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0asijjny34mcs7afr4haxnkz5mjx75243i72h4h5a5sbvydfx43m"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/vbauerster/mpb/v5"))
    (propagated-inputs
      `(("go-golang-org-x-sys" ,go-golang-org-x-sys)
        ("go-github-com-mattn-go-runewidth" ,go-github-com-mattn-go-runewidth)
        ("go-github-com-acarl005-stripansi" ,go-github-com-acarl005-stripansi)
        ("go-github-com-vividcortex-ewma" ,go-github-com-vividcortex-ewma)))
    (home-page "https://github.com/vbauerster/mpb")
    (synopsis "Multi Progress Bar")
    (description
      "Package mpb is a library for rendering progress bars in terminal applications.")
    (license license:unlicense)))

(define-public go-github-com-golang-protobuf
  (package
    (name "go-github-com-golang-protobuf")
    (version "1.5.2")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/golang/protobuf")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "1mh5fyim42dn821nsd3afnmgscrzzhn3h8rag635d2jnr23r1zhk"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/golang/protobuf"))
    (propagated-inputs
      `(("go-google-golang-org-protobuf" ,go-google-golang-org-protobuf)
        ("go-github-com-google-go-cmp" ,go-github-com-google-go-cmp)))
    (home-page "https://github.com/golang/protobuf")
    (synopsis "Go support for Protocol Buffers")
    (description
      "This module (@url{https://pkg.go.dev/mod/github.com/golang/protobuf,(code
github.com/golang/protobuf)}) contains Go bindings for protocol buffers.")
    (license license:bsd-3)))

(define-public go-github-com-google-go-cmp
  (package
    (name "go-github-com-google-go-cmp")
    (version "0.5.8")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/google/go-cmp")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0563bczyrmv9ps2p6n8af0m1jsszwdmkdkrxkv6dbm5bwjihhfgk"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/google/go-cmp"))
    (home-page "https://github.com/google/go-cmp")
    (synopsis "Package for equality of Go values")
    (description
      "This package is intended to be a more powerful and safer alternative to
@code{reflect.DeepEqual} for comparing whether two values are semantically
equal.")
    (license license:bsd-3)))

(define-public go-google-golang-org-protobuf
  (package
    (name "go-google-golang-org-protobuf")
    (version "1.28.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://go.googlesource.com/protobuf")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "1nzcc4qc00afi24nb7nlnwyzvvr6b8s8qdrn1sw085nygh2y2x8r"))))
    (build-system go-build-system)
    (arguments '(#:import-path "google.golang.org/protobuf"))
    (propagated-inputs
      `(("go-github-com-google-go-cmp" ,go-github-com-google-go-cmp)
        ("go-github-com-golang-protobuf" ,go-github-com-golang-protobuf)))
    (home-page "https://google.golang.org/protobuf")
    (synopsis "Go support for Protocol Buffers")
    (description
      "This project hosts the Go implementation for
@url{https://developers.google.com/protocol-buffers,protocol buffers}, which is
a language-neutral, platform-neutral, extensible mechanism for serializing
structured data.  The protocol buffer language is a language for specifying the
schema for structured data.  This schema is compiled into language specific
bindings.  This project provides both a tool to generate Go code for the
protocol buffer language, and also the runtime implementation to handle
serialization of messages in Go.  See the
@url{https://developers.google.com/protocol-buffers/docs/overview,protocol
buffer developer guide} for more information about protocol buffers themselves.")
    (license license:bsd-3)))

(define-public go-github-com-ssut-payload-dumper-go
  (package
    (name "go-github-com-ssut-payload-dumper-go")
    (version "0.0.0-20220526233327-8f7423e22048")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/ssut/payload-dumper-go")
               (commit (go-version->git-ref version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "12aff6j7h9lsp0x4c0g1m8a2c0glbr6sv1bbm930696yrql1qxxk"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/ssut/payload-dumper-go"))
    (propagated-inputs
      `(;("go-google-golang-org-protobuf" ,go-google-golang-org-protobuf)
        ("go-github-com-vbauerster-mpb-v5" ,go-github-com-vbauerster-mpb-v5)
        ("go-github-com-spencercw-go-xz" ,go-github-com-spencercw-go-xz)
;        ("go-github-com-golang-protobuf" ,go-github-com-golang-protobuf)
        ("go-github-com-dustin-go-humanize"
         ,go-github-com-dustin-go-humanize)))
    (home-page "https://github.com/ssut/payload-dumper-go")
    (synopsis "payload-dumper-go")
    (description "An android OTA payload dumper written in Go.")
    (license license:asl2.0)))
