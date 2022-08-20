(define-module (expanse packages tailscale)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (gnu packages golang)
  #:use-module (guix build-system go)
  #:use-module ((guix licenses) #:prefix license:))

;; Similar dependencies as dnscrypt-proxy2
(define-public tailscale
  (package
    (name "tailscale")
    (version "1.20.4")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/tailscale/tailscale")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0vkhfqq3rjhvmn07g6vx87ppnibjwwl5rvzp8vip1flxdqji7hhq"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/tailscale/tailscale"))
    (propagated-inputs
      `(;("go-software-sslmate-com-src-go-pkcs12"
        ; ,go-software-sslmate-com-src-go-pkcs12)
        ("go-mvdan-cc-unparam" ,go-mvdan-cc-unparam)
        ("go-mvdan-cc-lint" ,go-mvdan-cc-lint)
        ("go-mvdan-cc-interfacer" ,go-mvdan-cc-interfacer)
        ("go-mvdan-cc-gofumpt" ,go-mvdan-cc-gofumpt)
        ("go-howett-net-plist" ,go-howett-net-plist)
        ("go-gopkg-in-yaml-v3" ,go-gopkg-in-yaml-v3)
        ("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
        ("go-gopkg-in-warnings-v0" ,go-gopkg-in-warnings-v0)
        ("go-gopkg-in-ini-v1" ,go-gopkg-in-ini-v1)
        ("go-google-golang-org-protobuf" ,go-google-golang-org-protobuf)
        ("go-golang-zx2c4-com-wintun" ,go-golang-zx2c4-com-wintun)
        ("go-golang-org-x-xerrors" ,go-golang-org-x-xerrors)
        ("go-golang-org-x-text" ,go-golang-org-x-text)
        ("go-golang-org-x-mod" ,go-golang-org-x-mod)
        ("go-go4-org-unsafe-assume-no-moving-gc"
         ,go-go4-org-unsafe-assume-no-moving-gc)
        ("go-go4-org-intern" ,go-go4-org-intern)
        ("go-github-com-yeya24-promlinter" ,go-github-com-yeya24-promlinter)
        ("go-github-com-xanzy-ssh-agent" ,go-github-com-xanzy-ssh-agent)
        ("go-github-com-vishvananda-netns" ,go-github-com-vishvananda-netns)
        ("go-github-com-uudashr-gocognit" ,go-github-com-uudashr-gocognit)
        ("go-github-com-ultraware-whitespace"
         ,go-github-com-ultraware-whitespace)
        ("go-github-com-ultraware-funlen" ,go-github-com-ultraware-funlen)
        ("go-github-com-u-root-uio" ,go-github-com-u-root-uio)
        ("go-github-com-tommy-muehle-go-mnd-v2"
         ,go-github-com-tommy-muehle-go-mnd-v2)
        ("go-github-com-tomarrell-wrapcheck-v2"
         ,go-github-com-tomarrell-wrapcheck-v2)
        ("go-github-com-timakin-bodyclose" ,go-github-com-timakin-bodyclose)
        ("go-github-com-tetafro-godot" ,go-github-com-tetafro-godot)
        ("go-github-com-tdakkota-asciicheck"
         ,go-github-com-tdakkota-asciicheck)
        ("go-github-com-sylvia7788-contextcheck"
         ,go-github-com-sylvia7788-contextcheck)
        ("go-github-com-subosito-gotenv" ,go-github-com-subosito-gotenv)
        ("go-github-com-stretchr-testify" ,go-github-com-stretchr-testify)
        ("go-github-com-stretchr-objx" ,go-github-com-stretchr-objx)
        ("go-github-com-ssgreg-nlreturn-v2" ,go-github-com-ssgreg-nlreturn-v2)
        ("go-github-com-spf13-viper" ,go-github-com-spf13-viper)
        ("go-github-com-spf13-pflag" ,go-github-com-spf13-pflag)
        ("go-github-com-spf13-jwalterweatherman"
         ,go-github-com-spf13-jwalterweatherman)
        ("go-github-com-spf13-cobra" ,go-github-com-spf13-cobra)
        ("go-github-com-spf13-cast" ,go-github-com-spf13-cast)
        ("go-github-com-spf13-afero" ,go-github-com-spf13-afero)
        ("go-github-com-sourcegraph-go-diff"
         ,go-github-com-sourcegraph-go-diff)
        ("go-github-com-sonatard-noctx" ,go-github-com-sonatard-noctx)
        ("go-github-com-sivchari-tenv" ,go-github-com-sivchari-tenv)
        ("go-github-com-sirupsen-logrus" ,go-github-com-sirupsen-logrus)
        ("go-github-com-shazow-go-diff" ,go-github-com-shazow-go-diff)
        ("go-github-com-sergi-go-diff" ,go-github-com-sergi-go-diff)
        ("go-github-com-securego-gosec-v2" ,go-github-com-securego-gosec-v2)
        ("go-github-com-sassoftware-go-rpmutils"
         ,go-github-com-sassoftware-go-rpmutils)
        ("go-github-com-sanposhiho-wastedassign-v2"
         ,go-github-com-sanposhiho-wastedassign-v2)
        ("go-github-com-ryanrolds-sqlclosecheck"
         ,go-github-com-ryanrolds-sqlclosecheck)
        ("go-github-com-ryancurrah-gomodguard"
         ,go-github-com-ryancurrah-gomodguard)
        ("go-github-com-rogpeppe-go-internal"
         ,go-github-com-rogpeppe-go-internal)
        ("go-github-com-rivo-uniseg" ,go-github-com-rivo-uniseg)
        ("go-github-com-quasilyte-regex-syntax"
         ,go-github-com-quasilyte-regex-syntax)
        ("go-github-com-quasilyte-go-ruleguard"
         ,go-github-com-quasilyte-go-ruleguard)
        ("go-github-com-prometheus-procfs" ,go-github-com-prometheus-procfs)
        ("go-github-com-prometheus-common" ,go-github-com-prometheus-common)
        ("go-github-com-prometheus-client-model"
         ,go-github-com-prometheus-client-model)
        ("go-github-com-prometheus-client-golang"
         ,go-github-com-prometheus-client-golang)
        ("go-github-com-polyfloyd-go-errorlint"
         ,go-github-com-polyfloyd-go-errorlint)
        ("go-github-com-pmezard-go-difflib" ,go-github-com-pmezard-go-difflib)
        ("go-github-com-pkg-errors" ,go-github-com-pkg-errors)
        ("go-github-com-pkg-diff" ,go-github-com-pkg-diff)
        ("go-github-com-phayes-checkstyle" ,go-github-com-phayes-checkstyle)
        ("go-github-com-pelletier-go-toml" ,go-github-com-pelletier-go-toml)
        ("go-github-com-op-go-logging" ,go-github-com-op-go-logging)
        ("go-github-com-olekukonko-tablewriter"
         ,go-github-com-olekukonko-tablewriter)
        ("go-github-com-nishanths-predeclared"
         ,go-github-com-nishanths-predeclared)
        ("go-github-com-nishanths-exhaustive"
         ,go-github-com-nishanths-exhaustive)
        ("go-github-com-nbutton23-zxcvbn-go"
         ,go-github-com-nbutton23-zxcvbn-go)
        ("go-github-com-nakabonne-nestif" ,go-github-com-nakabonne-nestif)
        ("go-github-com-moricho-tparallel" ,go-github-com-moricho-tparallel)
        ("go-github-com-mitchellh-reflectwalk"
         ,go-github-com-mitchellh-reflectwalk)
        ("go-github-com-mitchellh-mapstructure"
         ,go-github-com-mitchellh-mapstructure)
        ("go-github-com-mitchellh-go-homedir"
         ,go-github-com-mitchellh-go-homedir)
        ("go-github-com-mitchellh-copystructure"
         ,go-github-com-mitchellh-copystructure)
        ("go-github-com-mgechev-revive" ,go-github-com-mgechev-revive)
        ("go-github-com-mgechev-dots" ,go-github-com-mgechev-dots)
        ("go-github-com-mdlayher-socket" ,go-github-com-mdlayher-socket)
        ("go-github-com-mbilski-exhaustivestruct"
         ,go-github-com-mbilski-exhaustivestruct)
        ("go-github-com-matttproud-golang-protobuf-extensions"
         ,go-github-com-matttproud-golang-protobuf-extensions)
        ("go-github-com-mattn-go-runewidth" ,go-github-com-mattn-go-runewidth)
        ("go-github-com-mattn-go-isatty" ,go-github-com-mattn-go-isatty)
        ("go-github-com-mattn-go-colorable" ,go-github-com-mattn-go-colorable)
        ("go-github-com-matoous-godox" ,go-github-com-matoous-godox)
        ("go-github-com-maratori-testpackage"
         ,go-github-com-maratori-testpackage)
        ("go-github-com-magiconair-properties"
         ,go-github-com-magiconair-properties)
        ("go-github-com-ldez-tagliatelle" ,go-github-com-ldez-tagliatelle)
        ("go-github-com-ldez-gomoddirectives"
         ,go-github-com-ldez-gomoddirectives)
        ("go-github-com-kyoh86-exportloopref"
         ,go-github-com-kyoh86-exportloopref)
        ("go-github-com-kunwardeep-paralleltest"
         ,go-github-com-kunwardeep-paralleltest)
        ("go-github-com-kulti-thelper" ,go-github-com-kulti-thelper)
        ("go-github-com-kr-text" ,go-github-com-kr-text)
        ("go-github-com-kr-pretty" ,go-github-com-kr-pretty)
        ("go-github-com-kr-fs" ,go-github-com-kr-fs)
        ("go-github-com-kisielk-gotool" ,go-github-com-kisielk-gotool)
        ("go-github-com-kisielk-errcheck" ,go-github-com-kisielk-errcheck)
        ("go-github-com-kevinburke-ssh-config"
         ,go-github-com-kevinburke-ssh-config)
        ("go-github-com-julz-importas" ,go-github-com-julz-importas)
        ("go-github-com-josharian-native" ,go-github-com-josharian-native)
        ("go-github-com-jmespath-go-jmespath"
         ,go-github-com-jmespath-go-jmespath)
        ("go-github-com-jirfag-go-printf-func-name"
         ,go-github-com-jirfag-go-printf-func-name)
        ("go-github-com-jingyugao-rowserrcheck"
         ,go-github-com-jingyugao-rowserrcheck)
        ("go-github-com-jgautheron-goconst" ,go-github-com-jgautheron-goconst)
        ("go-github-com-jbenet-go-context" ,go-github-com-jbenet-go-context)
        ("go-github-com-inconshreveable-mousetrap"
         ,go-github-com-inconshreveable-mousetrap)
        ("go-github-com-imdario-mergo" ,go-github-com-imdario-mergo)
        ("go-github-com-huandu-xstrings" ,go-github-com-huandu-xstrings)
        ("go-github-com-hashicorp-hcl" ,go-github-com-hashicorp-hcl)
        ("go-github-com-hashicorp-go-multierror"
         ,go-github-com-hashicorp-go-multierror)
        ("go-github-com-hashicorp-errwrap" ,go-github-com-hashicorp-errwrap)
        ("go-github-com-gostaticanalysis-nilerr"
         ,go-github-com-gostaticanalysis-nilerr)
        ("go-github-com-gostaticanalysis-forcetypeassert"
         ,go-github-com-gostaticanalysis-forcetypeassert)
        ("go-github-com-gostaticanalysis-comment"
         ,go-github-com-gostaticanalysis-comment)
        ("go-github-com-gostaticanalysis-analysisutil"
         ,go-github-com-gostaticanalysis-analysisutil)
        ("go-github-com-goreleaser-fileglob"
         ,go-github-com-goreleaser-fileglob)
        ("go-github-com-goreleaser-chglog" ,go-github-com-goreleaser-chglog)
        ("go-github-com-gordonklaus-ineffassign"
         ,go-github-com-gordonklaus-ineffassign)
        ("go-github-com-google-rpmpack" ,go-github-com-google-rpmpack)
        ("go-github-com-google-goterm" ,go-github-com-google-goterm)
        ("go-github-com-google-btree" ,go-github-com-google-btree)
        ("go-github-com-golangci-unconvert" ,go-github-com-golangci-unconvert)
        ("go-github-com-golangci-revgrep" ,go-github-com-golangci-revgrep)
        ("go-github-com-golangci-misspell" ,go-github-com-golangci-misspell)
        ("go-github-com-golangci-maligned" ,go-github-com-golangci-maligned)
        ("go-github-com-golangci-lint-1" ,go-github-com-golangci-lint-1)
        ("go-github-com-golangci-golangci-lint"
         ,go-github-com-golangci-golangci-lint)
        ("go-github-com-golangci-gofmt" ,go-github-com-golangci-gofmt)
        ("go-github-com-golangci-go-misc" ,go-github-com-golangci-go-misc)
        ("go-github-com-golangci-dupl" ,go-github-com-golangci-dupl)
        ("go-github-com-golangci-check" ,go-github-com-golangci-check)
        ("go-github-com-golang-protobuf" ,go-github-com-golang-protobuf)
        ("go-github-com-gofrs-flock" ,go-github-com-gofrs-flock)
        ("go-github-com-gobwas-glob" ,go-github-com-gobwas-glob)
        ("go-github-com-go-xmlfmt-xmlfmt" ,go-github-com-go-xmlfmt-xmlfmt)
        ("go-github-com-go-toolsmith-typep" ,go-github-com-go-toolsmith-typep)
        ("go-github-com-go-toolsmith-strparse"
         ,go-github-com-go-toolsmith-strparse)
        ("go-github-com-go-toolsmith-astp" ,go-github-com-go-toolsmith-astp)
        ("go-github-com-go-toolsmith-astfmt"
         ,go-github-com-go-toolsmith-astfmt)
        ("go-github-com-go-toolsmith-astequal"
         ,go-github-com-go-toolsmith-astequal)
        ("go-github-com-go-toolsmith-astcopy"
         ,go-github-com-go-toolsmith-astcopy)
        ("go-github-com-go-toolsmith-astcast"
         ,go-github-com-go-toolsmith-astcast)
        ("go-github-com-go-git-go-git-v5" ,go-github-com-go-git-go-git-v5)
        ("go-github-com-go-git-go-billy-v5" ,go-github-com-go-git-go-billy-v5)
        ("go-github-com-go-git-gcfg" ,go-github-com-go-git-gcfg)
        ("go-github-com-go-critic-go-critic"
         ,go-github-com-go-critic-go-critic)
        ("go-github-com-fzipp-gocyclo" ,go-github-com-fzipp-gocyclo)
        ("go-github-com-fsnotify-fsnotify" ,go-github-com-fsnotify-fsnotify)
        ("go-github-com-fatih-structtag" ,go-github-com-fatih-structtag)
        ("go-github-com-fatih-color" ,go-github-com-fatih-color)
        ("go-github-com-ettle-strcase" ,go-github-com-ettle-strcase)
        ("go-github-com-esimonov-ifshort" ,go-github-com-esimonov-ifshort)
        ("go-github-com-emirpasic-gods" ,go-github-com-emirpasic-gods)
        ("go-github-com-denis-tingajkin-go-header"
         ,go-github-com-denis-tingajkin-go-header)
        ("go-github-com-davecgh-go-spew" ,go-github-com-davecgh-go-spew)
        ("go-github-com-daixiang0-gci" ,go-github-com-daixiang0-gci)
        ("go-github-com-chavacava-garif" ,go-github-com-chavacava-garif)
        ("go-github-com-charithe-durationcheck"
         ,go-github-com-charithe-durationcheck)
        ("go-github-com-cespare-xxhash-v2" ,go-github-com-cespare-xxhash-v2)
        ("go-github-com-cavaliercoder-go-cpio"
         ,go-github-com-cavaliercoder-go-cpio)
        ("go-github-com-butuzov-ireturn" ,go-github-com-butuzov-ireturn)
        ("go-github-com-breml-bidichk" ,go-github-com-breml-bidichk)
        ("go-github-com-bombsimon-wsl-v3" ,go-github-com-bombsimon-wsl-v3)
        ("go-github-com-blizzy78-varnamelen"
         ,go-github-com-blizzy78-varnamelen)
        ("go-github-com-blakesmith-ar" ,go-github-com-blakesmith-ar)
        ("go-github-com-bkielbasa-cyclop" ,go-github-com-bkielbasa-cyclop)
        ("go-github-com-beorn7-perks" ,go-github-com-beorn7-perks)
        ("go-github-com-aws-smithy-go" ,go-github-com-aws-smithy-go)
        ("go-github-com-aws-aws-sdk-go-v2-service-sts"
         ,go-github-com-aws-aws-sdk-go-v2-service-sts)
        ("go-github-com-aws-aws-sdk-go-v2-service-sso"
         ,go-github-com-aws-aws-sdk-go-v2-service-sso)
        ("go-github-com-aws-aws-sdk-go-v2-service-internal-s3shared"
         ,go-github-com-aws-aws-sdk-go-v2-service-internal-s3shared)
        ("go-github-com-aws-aws-sdk-go-v2-service-internal-presigned-url"
         ,go-github-com-aws-aws-sdk-go-v2-service-internal-presigned-url)
        ("go-github-com-aws-aws-sdk-go-v2-service-internal-accept-encoding"
         ,go-github-com-aws-aws-sdk-go-v2-service-internal-accept-encoding)
        ("go-github-com-aws-aws-sdk-go-v2-internal-ini"
         ,go-github-com-aws-aws-sdk-go-v2-internal-ini)
        ("go-github-com-aws-aws-sdk-go-v2-internal-endpoints-v2"
         ,go-github-com-aws-aws-sdk-go-v2-internal-endpoints-v2)
        ("go-github-com-aws-aws-sdk-go-v2-internal-configsources"
         ,go-github-com-aws-aws-sdk-go-v2-internal-configsources)
        ("go-github-com-aws-aws-sdk-go-v2-feature-ec2-imds"
         ,go-github-com-aws-aws-sdk-go-v2-feature-ec2-imds)
        ("go-github-com-aws-aws-sdk-go-v2-credentials"
         ,go-github-com-aws-aws-sdk-go-v2-credentials)
        ("go-github-com-aws-aws-sdk-go-v2-aws-protocol-eventstream"
         ,go-github-com-aws-aws-sdk-go-v2-aws-protocol-eventstream)
        ("go-github-com-ashanbrown-makezero"
         ,go-github-com-ashanbrown-makezero)
        ("go-github-com-ashanbrown-forbidigo"
         ,go-github-com-ashanbrown-forbidigo)
        ("go-github-com-alexkohler-prealloc"
         ,go-github-com-alexkohler-prealloc)
        ("go-github-com-acomagu-bufpipe" ,go-github-com-acomagu-bufpipe)
        ("go-github-com-protonmail-go-crypto"
         ,go-github-com-protonmail-go-crypto)
        ("go-github-com-openpeedeep-depguard"
         ,go-github-com-openpeedeep-depguard)
        ("go-github-com-microsoft-go-winio" ,go-github-com-microsoft-go-winio)
        ("go-github-com-masterminds-sprig" ,go-github-com-masterminds-sprig)
        ("go-github-com-masterminds-semver-v3"
         ,go-github-com-masterminds-semver-v3)
        ("go-github-com-masterminds-semver" ,go-github-com-masterminds-semver)
        ("go-github-com-masterminds-goutils"
         ,go-github-com-masterminds-goutils)
        ("go-github-com-djarvur-go-err113" ,go-github-com-djarvur-go-err113)
        ("go-github-com-burntsushi-toml" ,go-github-com-burntsushi-toml)
        ("go-github-com-antonboom-nilnil" ,go-github-com-antonboom-nilnil)
        ("go-github-com-antonboom-errname" ,go-github-com-antonboom-errname)
        ("go-4d63-com-gochecknoglobals" ,go-4d63-com-gochecknoglobals)
        ("go-nhooyr-io-websocket" ,go-nhooyr-io-websocket)
        ("go-inet-af-wf" ,go-inet-af-wf)
        ("go-inet-af-peercred" ,go-inet-af-peercred)
        ("go-inet-af-netstack" ,go-inet-af-netstack)
        ("go-inet-af-netaddr" ,go-inet-af-netaddr)
        ("go-honnef-co-go-tools" ,go-honnef-co-go-tools)
        ("go-golang-zx2c4-com-wireguard-windows"
         ,go-golang-zx2c4-com-wireguard-windows)
        ("go-golang-zx2c4-com-wireguard" ,go-golang-zx2c4-com-wireguard)
        ("go-golang-org-x-tools" ,go-golang-org-x-tools)
        ("go-golang-org-x-time" ,go-golang-org-x-time)
        ("go-golang-org-x-term" ,go-golang-org-x-term)
        ("go-golang-org-x-sys" ,go-golang-org-x-sys)
        ("go-golang-org-x-sync" ,go-golang-org-x-sync)
        ("go-golang-org-x-net" ,go-golang-org-x-net)
        ("go-golang-org-x-crypto" ,go-golang-org-x-crypto)
        ("go-go4-org-mem" ,go-go4-org-mem)
        ("go-github-com-vishvananda-netlink"
         ,go-github-com-vishvananda-netlink)
        ("go-github-com-ulikunitz-xz" ,go-github-com-ulikunitz-xz)
        ("go-github-com-toqueteos-webbrowser"
         ,go-github-com-toqueteos-webbrowser)
        ("go-github-com-tcnksm-go-httpstat" ,go-github-com-tcnksm-go-httpstat)
        ("go-github-com-tailscale-netlink" ,go-github-com-tailscale-netlink)
        ("go-github-com-tailscale-hujson" ,go-github-com-tailscale-hujson)
        ("go-github-com-tailscale-goupnp" ,go-github-com-tailscale-goupnp)
        ("go-github-com-tailscale-goexpect" ,go-github-com-tailscale-goexpect)
        ("go-github-com-tailscale-depaware" ,go-github-com-tailscale-depaware)
        ("go-github-com-tailscale-certstore"
         ,go-github-com-tailscale-certstore)
        ("go-github-com-skip2-go-qrcode" ,go-github-com-skip2-go-qrcode)
        ("go-github-com-pkg-sftp" ,go-github-com-pkg-sftp)
        ("go-github-com-peterbourgon-ff-v3" ,go-github-com-peterbourgon-ff-v3)
        ("go-github-com-pborman-getopt" ,go-github-com-pborman-getopt)
        ("go-github-com-mitchellh-go-ps" ,go-github-com-mitchellh-go-ps)
        ("go-github-com-miekg-dns" ,go-github-com-miekg-dns)
        ("go-github-com-mdlayher-sdnotify" ,go-github-com-mdlayher-sdnotify)
        ("go-github-com-mdlayher-netlink" ,go-github-com-mdlayher-netlink)
        ("go-github-com-klauspost-compress" ,go-github-com-klauspost-compress)
        ("go-github-com-kballard-go-shellquote"
         ,go-github-com-kballard-go-shellquote)
        ("go-github-com-jsimonetti-rtnetlink"
         ,go-github-com-jsimonetti-rtnetlink)
        ("go-github-com-insomniacslk-dhcp" ,go-github-com-insomniacslk-dhcp)
        ("go-github-com-iancoleman-strcase" ,go-github-com-iancoleman-strcase)
        ("go-github-com-goreleaser-nfpm" ,go-github-com-goreleaser-nfpm)
        ("go-github-com-google-uuid" ,go-github-com-google-uuid)
        ("go-github-com-google-go-cmp" ,go-github-com-google-go-cmp)
        ("go-github-com-golang-groupcache" ,go-github-com-golang-groupcache)
        ("go-github-com-godbus-dbus-v5" ,go-github-com-godbus-dbus-v5)
        ("go-github-com-go-ole-go-ole" ,go-github-com-go-ole-go-ole)
        ("go-github-com-gliderlabs-ssh" ,go-github-com-gliderlabs-ssh)
        ("go-github-com-frankban-quicktest" ,go-github-com-frankban-quicktest)
        ("go-github-com-dave-jennifer" ,go-github-com-dave-jennifer)
        ("go-github-com-creack-pty" ,go-github-com-creack-pty)
        ("go-github-com-coreos-go-iptables" ,go-github-com-coreos-go-iptables)
        ("go-github-com-aws-aws-sdk-go-v2-service-ssm"
         ,go-github-com-aws-aws-sdk-go-v2-service-ssm)
        ("go-github-com-aws-aws-sdk-go-v2-service-s3"
         ,go-github-com-aws-aws-sdk-go-v2-service-s3)
        ("go-github-com-aws-aws-sdk-go-v2-feature-s3-manager"
         ,go-github-com-aws-aws-sdk-go-v2-feature-s3-manager)
        ("go-github-com-aws-aws-sdk-go-v2-config"
         ,go-github-com-aws-aws-sdk-go-v2-config)
        ("go-github-com-aws-aws-sdk-go-v2" ,go-github-com-aws-aws-sdk-go-v2)
        ("go-github-com-anmitsu-go-shlex" ,go-github-com-anmitsu-go-shlex)
        ("go-github-com-alexbrainman-sspi" ,go-github-com-alexbrainman-sspi)
        ("go-github-com-akutz-memconn" ,go-github-com-akutz-memconn)
        ("go-filippo-io-mkcert" ,go-filippo-io-mkcert)))
    (home-page "https://github.com/tailscale/tailscale")
    (synopsis "Tailscale")
    (description "Package tailscaleroot embeds VERSION.txt into the binary.")
    (license #f)))
