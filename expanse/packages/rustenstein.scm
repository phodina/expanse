(define-module (expanse packages rustenstein)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (gnu packages crates-io)
  #:use-module (guix build-system cargo)
  #:use-module ((guix licenses) #:prefix license:))

(define-public rustenstein
(let ((commit "e68af415ec532f0c5fa65bba33dff6e332fd83c6")
      (revision "1"))
  (package
    (name "rustenstein")
    (version "0.1.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
		(url "https://github.com/AdRoll/rustenstein")
		(commit commit)))
        (sha256
          (base32 "09ypn2wmjnyvcab6k8msd0rn6im33q4lqn9y6h0v8q2wynxjll6h"))))
    (build-system cargo-build-system)
    (arguments
      `(#:tests? #f
        #:cargo-inputs
        (("rust-clap-3" ,rust-clap-3)
         ("rust-num-0.4" ,rust-num-0.4)
         ("rust-sdl2-0.35" ,rust-sdl2-0.35))))
    (home-page "https://tech.nextroll.com/blog/dev/2022/02/02/rustenstein.html")
    (synopsis
      "Wolfenstein 3D port in Rust")
    (description
      "")
    (license license:expat))))

(define-public rust-wgpu-types-0.10
  (package
    (name "rust-wgpu-types")
    (version "0.10.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "wgpu-types" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "061yi2nxr6dfm5j9vn2f649jpw0yivmhr28hkyd23csaybxv5zi5"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-bitflags" ,rust-bitflags-1) ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/gfx-rs/wgpu")
    (synopsis "WebGPU types")
    (description "WebGPU types")
    (license (list license:expat license:asl2.0))))

(define-public rust-renderdoc-sys-0.7
  (package
    (name "rust-renderdoc-sys")
    (version "0.7.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "renderdoc-sys" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0mx1crv83mwmfl7yvhnpmhjb01fx5yd9f3f2gpwlnb1518gjsf7i"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://github.com/ebkalderon/renderdoc-rs/tree/master/renderdoc-sys")
    (synopsis "Raw FFI bindings to the RenderDoc API")
    (description "Raw FFI bindings to the RenderDoc API")
    (license (list license:expat license:asl2.0))))

(define-public rust-range-alloc-0.1
  (package
    (name "rust-range-alloc")
    (version "0.1.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "range-alloc" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1diq0lpp4649qrzx88q26aal13x563bb5w6j037nvk09bv23bsb3"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/gfx-rs/gfx")
    (synopsis "Generic range allocator used by gfx-rs backends")
    (description "Generic range allocator used by gfx-rs backends")
    (license (list license:expat license:asl2.0))))

(define-public rust-metal-0.23
  (package
    (name "rust-metal")
    (version "0.23.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "metal" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1110rmnpvy7m3xy6cbfgw79i46qw5hgf17irmcr3dh2c3x4lylg0"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-bitflags" ,rust-bitflags-1)
         ("rust-block" ,rust-block-0.1)
         ("rust-core-graphics-types" ,rust-core-graphics-types-0.1)
         ("rust-dispatch" ,rust-dispatch-0.2)
         ("rust-foreign-types" ,rust-foreign-types-0.3)
         ("rust-log" ,rust-log-0.4)
         ("rust-objc" ,rust-objc-0.2))))
    (home-page "https://github.com/gfx-rs/metal-rs")
    (synopsis "Rust bindings for Metal")
    (description "Rust bindings for Metal")
    (license (list license:expat license:asl2.0))))

(define-public rust-khronos-egl-4
  (package
    (name "rust-khronos-egl")
    (version "4.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "khronos-egl" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1qqm42ix278w72snhss8sw8kq4y8c11z4h4xrdqvikhb3nym48wc"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-libc" ,rust-libc-0.2)
         ("rust-libloading" ,rust-libloading-0.7)
         ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "https://github.com/timothee-haudebourg/khronos-egl")
    (synopsis "Rust bindings for EGL")
    (description "Rust bindings for EGL")
    (license (list license:expat license:asl2.0))))

(define-public rust-inplace-it-0.3
  (package
    (name "rust-inplace-it")
    (version "0.3.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "inplace_it" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1jpppakqdazlzmlqx8vmb78drzgv93w52gk4lii6vzkri8q3z5ch"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/NotIntMan/inplace_it")
    (synopsis "Place small arrays on the stack with a low-cost!")
    (description "Place small arrays on the stack with a low-cost!")
    (license license:expat)))

(define-public rust-gpu-descriptor-types-0.1
  (package
    (name "rust-gpu-descriptor-types")
    (version "0.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "gpu-descriptor-types" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "09i17z9943npl59lqy2y9h9562ri98xdxyccyvz6ilaswmvkcgin"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build? #t #:cargo-inputs (("rust-bitflags" ,rust-bitflags-1))))
    (home-page "https://github.com/zakarumych/gpu-descriptor")
    (synopsis "Core types of gpu-descriptor crate")
    (description "Core types of gpu-descriptor crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-gpu-descriptor-0.2
  (package
    (name "rust-gpu-descriptor")
    (version "0.2.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "gpu-descriptor" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1nhxr0hyh0bmm2m5pjiy02227k13hfk3qa4sf7s5yh2dpqbz4f55"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-bitflags" ,rust-bitflags-1)
         ("rust-gpu-descriptor-types" ,rust-gpu-descriptor-types-0.1)
         ("rust-hashbrown" ,rust-hashbrown-0.11)
         ("rust-serde" ,rust-serde-1)
         ("rust-tracing" ,rust-tracing-0.1))))
    (home-page "https://github.com/zakarumych/gpu-descriptor")
    (synopsis
      "Implementation agnostic descriptor allocator for Vulkan like APIs")
    (description
      "Implementation agnostic descriptor allocator for Vulkan like APIs")
    (license (list license:expat license:asl2.0))))

(define-public rust-valuable-derive-0.1
  (package
    (name "rust-valuable-derive")
    (version "0.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "valuable-derive" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0cjvqljzsj891cjzlwv0ihrv4m0n5211a6pr6b7cz42ich66ji4x"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-proc-macro2" ,rust-proc-macro2-1)
         ("rust-quote" ,rust-quote-1)
         ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/tokio-rs/valuable")
    (synopsis "Macros for the `valuable` crate.")
    (description "Macros for the `valuable` crate.")
    (license license:expat)))

(define-public rust-valuable-0.1
  (package
    (name "rust-valuable")
    (version "0.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "valuable" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0v9gp3nkjbl30z0fd56d8mx7w1csk86wwjhfjhr400wh9mfpw2w3"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-valuable-derive" ,rust-valuable-derive-0.1))))
    (home-page "https://github.com/tokio-rs/valuable")
    (synopsis
      "Object-safe value inspection, used to pass un-typed structured data across trait-object boundaries.
")
    (description
      "Object-safe value inspection, used to pass un-typed structured data across
trait-object boundaries.")
    (license license:expat)))

(define-public rust-tracing-core-0.1
  (package
    (name "rust-tracing-core")
    (version "0.1.22")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "tracing-core" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "08wssa1n70vg02nfw6ykfzjhind88ws8vjqi64nsfch6718wpkq3"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-lazy-static" ,rust-lazy-static-1)
         ("rust-valuable" ,rust-valuable-0.1))))
    (home-page "https://tokio.rs")
    (synopsis "Core primitives for application-level tracing.
")
    (description "Core primitives for application-level tracing.")
    (license license:expat)))

(define-public rust-tracing-attributes-0.1
  (package
    (name "rust-tracing-attributes")
    (version "0.1.19")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "tracing-attributes" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "05m7wxidfsx3mnvi8adq8532cn1xnm8as0skmnvxfn55lfjdjxl2"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-proc-macro2" ,rust-proc-macro2-1)
         ("rust-quote" ,rust-quote-1)
         ("rust-syn" ,rust-syn-1))))
    (home-page "https://tokio.rs")
    (synopsis
      "Procedural macro attributes for automatically instrumenting functions.
")
    (description
      "Procedural macro attributes for automatically instrumenting functions.")
    (license license:expat)))

(define-public rust-tracing-0.1
  (package
    (name "rust-tracing")
    (version "0.1.31")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "tracing" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "17wvxyppvkqgs1cc583sjrd4q8nirchks0vgff9xvlhcxyl51ipn"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-cfg-if" ,rust-cfg-if-1)
         ("rust-log" ,rust-log-0.4)
         ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
         ("rust-tracing-attributes" ,rust-tracing-attributes-0.1)
         ("rust-tracing-core" ,rust-tracing-core-0.1))))
    (home-page "https://tokio.rs")
    (synopsis "Application-level tracing for Rust.
")
    (description "Application-level tracing for Rust.")
    (license license:expat)))

(define-public rust-gpu-alloc-types-0.2
  (package
    (name "rust-gpu-alloc-types")
    (version "0.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "gpu-alloc-types" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "19b7zqg0va1lqcr7sj2z66cvasgg1p8imv7aninz5my9dc6lv02l"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build? #t #:cargo-inputs (("rust-bitflags" ,rust-bitflags-1))))
    (home-page "https://github.com/zakarumych/gpu-alloc")
    (synopsis "Core types of gpu-alloc crate")
    (description "Core types of gpu-alloc crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-gpu-alloc-0.5
  (package
    (name "rust-gpu-alloc")
    (version "0.5.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "gpu-alloc" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "13c1vqbzgch32w9sjvc7m1lnyr6xc72qczvhwrv0wc8ff5grxibz"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-bitflags" ,rust-bitflags-1)
         ("rust-gpu-alloc-types" ,rust-gpu-alloc-types-0.2)
         ("rust-serde" ,rust-serde-1)
         ("rust-tracing" ,rust-tracing-0.1))))
    (home-page "https://github.com/zakarumych/gpu-alloc")
    (synopsis "Implementation agnostic memory allocator for Vulkan like APIs")
    (description
      "Implementation agnostic memory allocator for Vulkan like APIs")
    (license (list license:expat license:asl2.0))))

(define-public rust-slotmap-1
  (package
    (name "rust-slotmap")
    (version "1.0.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "slotmap" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0hhkvsc3x79c7fh97b3padjhssd19hzdyyiv291mr3qf3lk8xq71"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-serde" ,rust-serde-1)
         ("rust-version-check" ,rust-version-check-0.9))))
    (home-page "https://github.com/orlp/slotmap")
    (synopsis "Slotmap data structure")
    (description "Slotmap data structure")
    (license license:zlib)))

(define-public rust-glow-0.11
  (package
    (name "rust-glow")
    (version "0.11.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "glow" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "068rqvczh691385gzwqqsclp8lr0zq3276x2hfnbh6ba2mvmigfq"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-js-sys" ,rust-js-sys-0.3)
         ("rust-slotmap" ,rust-slotmap-1)
         ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
         ("rust-web-sys" ,rust-web-sys-0.3))))
    (home-page "https://github.com/grovesNL/glow.git")
    (synopsis
      "GL on Whatever: a set of bindings to run GL (Open GL, OpenGL ES, and WebGL) anywhere, and avoid target-specific code.")
    (description
      "GL on Whatever: a set of bindings to run GL (Open GL, OpenGL ES, and WebGL)
anywhere, and avoid target-specific code.")
    (license (list license:expat license:asl2.0))))

(define-public rust-d3d12-0.4
  (package
    (name "rust-d3d12")
    (version "0.4.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "d3d12" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0339f9ij9hq4bxk31km97sy0jdc8if14pvkdssly15hyimwgvbid"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-bitflags" ,rust-bitflags-1)
         ("rust-libloading" ,rust-libloading-0.7)
         ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/gfx-rs/d3d12-rs")
    (synopsis "Low level D3D12 API wrapper")
    (description "Low level D3D12 API wrapper")
    (license (list license:expat license:asl2.0))))

(define-public rust-ash-0.33
  (package
    (name "rust-ash")
    (version "0.33.3+1.2.191")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ash" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "06cjq0h5dlikf2mfnnyj2ywpkym6389x35ij86p3iy34y611skyc"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-libloading" ,rust-libloading-0.7))))
    (home-page "https://github.com/MaikKlein/ash")
    (synopsis "Vulkan bindings for Rust")
    (description "Vulkan bindings for Rust")
    (license license:expat)))

(define-public rust-wgpu-hal-0.10
  (package
    (name "rust-wgpu-hal")
    (version "0.10.7")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "wgpu-hal" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1qkzsgs5af20lz94nvblcybgjjyn3ycwr89xx679bwdz2x5qkk97"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-arrayvec" ,rust-arrayvec-0.7)
         ("rust-ash" ,rust-ash-0.33)
         ("rust-bit-set" ,rust-bit-set-0.5)
         ("rust-bitflags" ,rust-bitflags-1)
         ("rust-block" ,rust-block-0.1)
         ("rust-core-graphics-types" ,rust-core-graphics-types-0.1)
         ("rust-d3d12" ,rust-d3d12-0.4)
         ("rust-foreign-types" ,rust-foreign-types-0.3)
         ("rust-fxhash" ,rust-fxhash-0.2)
         ("rust-glow" ,rust-glow-0.11)
         ("rust-gpu-alloc" ,rust-gpu-alloc-0.5)
         ("rust-gpu-descriptor" ,rust-gpu-descriptor-0.2)
         ("rust-inplace-it" ,rust-inplace-it-0.3)
         ("rust-khronos-egl" ,rust-khronos-egl-4)
         ("rust-libloading" ,rust-libloading-0.7)
         ("rust-log" ,rust-log-0.4)
         ("rust-metal" ,rust-metal-0.23)
         ("rust-naga" ,rust-naga-0.6)
         ("rust-objc" ,rust-objc-0.2)
         ("rust-parking-lot" ,rust-parking-lot-0.11)
         ("rust-range-alloc" ,rust-range-alloc-0.1)
         ("rust-raw-window-handle" ,rust-raw-window-handle-0.3)
         ("rust-renderdoc-sys" ,rust-renderdoc-sys-0.7)
         ("rust-thiserror" ,rust-thiserror-1)
         ("rust-wgpu-types" ,rust-wgpu-types-0.10)
         ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/gfx-rs/wgpu")
    (synopsis "WebGPU hardware abstraction layer")
    (description "WebGPU hardware abstraction layer")
    (license (list license:expat license:asl2.0))))

(define-public rust-tracy-client-sys-0.16
  (package
    (name "rust-tracy-client-sys")
    (version "0.16.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "tracy-client-sys" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0v9bnarxg89jp42zdfvmicj3a03rham1sjqapdzcwihdgzky89k2"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t #:cargo-inputs (("rust-cc" ,rust-cc-1))))
    (home-page "https://github.com/nagisa/rust_tracy_client")
    (synopsis
      "Low level bindings to the client libraries for the Tracy profiler
")
    (description
      "Low level bindings to the client libraries for the Tracy profiler")
    (license (list license:expat license:asl2.0))))

(define-public rust-tracy-client-0.12
  (package
    (name "rust-tracy-client")
    (version "0.12.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "tracy-client" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "00w272cwfxqqp9chks9skhsfviahs5pxihrmbjyhm647pxzy7h32"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-tracy-client-sys" ,rust-tracy-client-sys-0.16))))
    (home-page "https://github.com/nagisa/rust_tracy_client")
    (synopsis
      "High level bindings to the client libraries for the Tracy profiler
")
    (description
      "High level bindings to the client libraries for the Tracy profiler")
    (license (list license:expat license:asl2.0))))

(define-public rust-superluminal-perf-sys-0.1
  (package
    (name "rust-superluminal-perf-sys")
    (version "0.1.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "superluminal-perf-sys" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "05pz0yybf4y2iw3rvqf2crk04zv7610jjm3glhi8hlv2rhms0hh3"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/EmbarkStudios/superluminal-perf-rs")
    (synopsis "Superluminal Performance C API bindings")
    (description "Superluminal Performance C API bindings")
    (license (list license:expat license:asl2.0))))

(define-public rust-superluminal-perf-0.1
  (package
    (name "rust-superluminal-perf")
    (version "0.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "superluminal-perf" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0q0ykfn04i2qg5zfizp75y4dn2klpvhb6xfwlygq8jiabpgqvvc0"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-superluminal-perf-sys" ,rust-superluminal-perf-sys-0.1))))
    (home-page "https://github.com/EmbarkStudios/superluminal-perf-rs")
    (synopsis
      "Superluminal Performance API for adding user events to profiler captures")
    (description
      "Superluminal Performance API for adding user events to profiler captures")
    (license (list license:expat license:asl2.0))))

(define-public rust-puffin-0.12
  (package
    (name "rust-puffin")
    (version "0.12.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "puffin" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1qjpfjain74rmrlg3ycdwxxn7r1h9alynz13r2jr18i93vxi8d82"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-anyhow" ,rust-anyhow-1)
         ("rust-bincode" ,rust-bincode-1)
         ("rust-byteorder" ,rust-byteorder-1)
         ("rust-once-cell" ,rust-once-cell-1)
         ("rust-parking-lot" ,rust-parking-lot-0.11)
         ("rust-serde" ,rust-serde-1)
         ("rust-zstd" ,rust-zstd-0.9))))
    (home-page "https://github.com/EmbarkStudios/puffin")
    (synopsis "Simple instrumentation profiler for games")
    (description "Simple instrumentation profiler for games")
    (license (list license:expat license:asl2.0))))

(define-public rust-profiling-procmacros-1
  (package
    (name "rust-profiling-procmacros")
    (version "1.0.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "profiling-procmacros" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1bq0apl983lvbm9xgwp6crwnbi3rz066vc5bfghalscc2ms4f6qm"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-quote" ,rust-quote-1) ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/aclysma/profiling")
    (synopsis
      "This crate provides a very thin abstraction over other profiler crates.")
    (description
      "This crate provides a very thin abstraction over other profiler crates.")
    (license (list license:expat license:asl2.0))))

(define-public rust-optick-1
  (package
    (name "rust-optick")
    (version "1.3.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "optick" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0j35dj8ggfpcc399h1ljm6xfz8kszqc4nrw3vcl9kfndd1hapryp"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/bombomby/optick-rs")
    (synopsis "Super Lightweight Performance Profiler")
    (description "Super Lightweight Performance Profiler")
    (license license:expat)))

(define-public rust-profiling-1
  (package
    (name "rust-profiling")
    (version "1.0.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "profiling" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "11xrbgrf5wyc3ndskl2aljr2gx35av9gf364k2666g6ry45aqici"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-optick" ,rust-optick-1)
         ("rust-profiling-procmacros" ,rust-profiling-procmacros-1)
         ("rust-puffin" ,rust-puffin-0.12)
         ("rust-superluminal-perf" ,rust-superluminal-perf-0.1)
         ("rust-tracing" ,rust-tracing-0.1)
         ("rust-tracy-client" ,rust-tracy-client-0.12))))
    (home-page "https://github.com/aclysma/profiling")
    (synopsis
      "This crate provides a very thin abstraction over other profiler crates.")
    (description
      "This crate provides a very thin abstraction over other profiler crates.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wgpu-core-0.10
  (package
    (name "rust-wgpu-core")
    (version "0.10.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "wgpu-core" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "168c168726fb8vnxnw6r8ch8vlyhsqp1y62qdkpkqvm3fcjccqzr"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-arrayvec" ,rust-arrayvec-0.7)
         ("rust-bitflags" ,rust-bitflags-1)
         ("rust-cfg-aliases" ,rust-cfg-aliases-0.1)
         ("rust-copyless" ,rust-copyless-0.1)
         ("rust-fxhash" ,rust-fxhash-0.2)
         ("rust-log" ,rust-log-0.4)
         ("rust-naga" ,rust-naga-0.6)
         ("rust-parking-lot" ,rust-parking-lot-0.11)
         ("rust-profiling" ,rust-profiling-1)
         ("rust-raw-window-handle" ,rust-raw-window-handle-0.3)
         ("rust-ron" ,rust-ron-0.6)
         ("rust-serde" ,rust-serde-1)
         ("rust-smallvec" ,rust-smallvec-1)
         ("rust-thiserror" ,rust-thiserror-1)
         ("rust-wgpu-hal" ,rust-wgpu-hal-0.10)
         ("rust-wgpu-hal" ,rust-wgpu-hal-0.10)
         ("rust-wgpu-types" ,rust-wgpu-types-0.10))))
    (home-page "https://github.com/gfx-rs/wgpu")
    (synopsis "WebGPU core logic on wgpu-hal")
    (description "WebGPU core logic on wgpu-hal")
    (license (list license:expat license:asl2.0))))

(define-public rust-web-sys-0.3
  (package
    (name "rust-web-sys")
    (version "0.3.51")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "web-sys" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "10p514z7zmwzxqll0z0zqhlswv3hadbrwais3l8zfgcz6xxl2a78"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-js-sys" ,rust-js-sys-0.3)
         ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2))))
    (home-page "https://rustwasm.github.io/wasm-bindgen/web-sys/index.html")
    (synopsis
      "Bindings for all Web APIs, a procedurally generated crate from WebIDL
")
    (description
      "Bindings for all Web APIs, a procedurally generated crate from WebIDL")
    (license (list license:expat license:asl2.0))))

(define-public rust-spirv-0.2
  (package
    (name "rust-spirv")
    (version "0.2.0+1.5.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "spirv" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0c7qjinqpwcfxk00qx0j46z7i31lnzg2qnnar3gz3crxzqwglsr4"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-bitflags" ,rust-bitflags-1)
         ("rust-num-traits" ,rust-num-traits-0.2)
         ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/gfx-rs/rspirv")
    (synopsis "Rust definition of SPIR-V structs and enums")
    (description "Rust definition of SPIR-V structs and enums")
    (license license:asl2.0)))

(define-public rust-rose-tree-0.3
  (package
    (name "rust-rose-tree")
    (version "0.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rose_tree" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1bir822zssn8yrzzcbsv0awgihml0mkhj8la9zx4jn90x5hnrlgw"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-petgraph" ,rust-petgraph-0.6))))
    (home-page "https://github.com/mitchmindtree/rose_tree-rs")
    (synopsis
      "An indexable tree data structure with a variable and unbounded number of branches per node. It is Implemented on top of petgraph's Graph data structure and attempts to follow similar conventions where suitable.")
    (description
      "An indexable tree data structure with a variable and unbounded number of
branches per node.  It is Implemented on top of petgraph's Graph data structure
and attempts to follow similar conventions where suitable.")
    (license (list license:expat license:asl2.0))))

(define-public rust-pp-rs-0.2
  (package
    (name "rust-pp-rs")
    (version "0.2.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pp-rs" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1vkd9lgwf5rxy7qgzl8mka7vnghaq6nnn0nmg7mycl72ysvqnidv"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-unicode-xid" ,rust-unicode-xid-0.2))))
    (home-page "https://github.com/Kangz/glslpp-rs")
    (synopsis "Shader preprocessor")
    (description "Shader preprocessor")
    (license license:bsd-3)))

(define-public rust-naga-0.6
  (package
    (name "rust-naga")
    (version "0.6.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "naga" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1kqpp78wdl23c3w3iz74raxsfp8c1a70cwvsiswi1njibkjmjn4c"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-bit-set" ,rust-bit-set-0.5)
         ("rust-bitflags" ,rust-bitflags-1)
         ("rust-codespan-reporting" ,rust-codespan-reporting-0.11)
         ("rust-fxhash" ,rust-fxhash-0.2)
         ("rust-log" ,rust-log-0.4)
         ("rust-num-traits" ,rust-num-traits-0.2)
         ("rust-petgraph" ,rust-petgraph-0.6)
         ("rust-pp-rs" ,rust-pp-rs-0.2)
         ("rust-rose-tree" ,rust-rose-tree-0.3)
         ("rust-serde" ,rust-serde-1)
         ("rust-spirv" ,rust-spirv-0.2)
         ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/gfx-rs/naga")
    (synopsis "Shader translation infrastructure")
    (description "Shader translation infrastructure")
    (license (list license:expat license:asl2.0))))

(define-public rust-wgpu-0.10
  (package
    (name "rust-wgpu")
    (version "0.10.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "wgpu" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0is0a0f2iprjkz8lph4q3hrm34rdplb0qjy1zi3dpc3gkcnc04nb"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-arrayvec" ,rust-arrayvec-0.7)
         ("rust-js-sys" ,rust-js-sys-0.3)
         ("rust-log" ,rust-log-0.4)
         ("rust-naga" ,rust-naga-0.6)
         ("rust-parking-lot" ,rust-parking-lot-0.11)
         ("rust-raw-window-handle" ,rust-raw-window-handle-0.3)
         ("rust-serde" ,rust-serde-1)
         ("rust-smallvec" ,rust-smallvec-1)
         ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
         ("rust-wasm-bindgen-futures" ,rust-wasm-bindgen-futures-0.4)
         ("rust-web-sys" ,rust-web-sys-0.3)
         ("rust-wgpu-core" ,rust-wgpu-core-0.10)
         ("rust-wgpu-hal" ,rust-wgpu-hal-0.10)
         ("rust-wgpu-types" ,rust-wgpu-types-0.10))))
    (home-page "https://wgpu.rs/")
    (synopsis "Rusty WebGPU API wrapper")
    (description "Rusty WebGPU API wrapper")
    (license (list license:expat license:asl2.0))))

(define-public rust-pollster-0.2
  (package
    (name "rust-pollster")
    (version "0.2.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pollster" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1xzji8cq4crr795c7liy3ksd798sb45pjphbm8h5gvnp7whb18sx"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/zesterer/pollster")
    (synopsis "Synchronously block the thread until a future completes")
    (description "Synchronously block the thread until a future completes")
    (license (list license:asl2.0 license:expat))))

(define-public rust-version-compare-0.1
  (package
    (name "rust-version-compare")
    (version "0.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "version-compare" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0wyasmnqqngvm54x0gsxbwpxznvn747jkp0dx1nnppy1j9xj927y"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/timvisee/version-compare")
    (synopsis
      "A Rust library to easily compare version numbers, and test them against various comparison operators.")
    (description
      "This package provides a Rust library to easily compare version numbers, and test
them against various comparison operators.")
    (license license:expat)))

(define-public rust-vcpkg-0.2
  (package
    (name "rust-vcpkg")
    (version "0.2.15")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "vcpkg" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "09i4nf5y8lig6xgj3f7fyrvzd3nlaw4znrihw8psidvv5yk4xkdc"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/mcgoo/vcpkg-rs")
    (synopsis
      "A library to find native dependencies in a vcpkg tree at build
time in order to be used in Cargo build scripts.
")
    (description
      "This package provides a library to find native dependencies in a vcpkg tree at
build time in order to be used in Cargo build scripts.")
    (license (list license:expat license:asl2.0))))

(define-public rust-sdl2-sys-0.35
  (package
    (name "rust-sdl2-sys")
    (version "0.35.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "sdl2-sys" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1w7ranfpmbvsnviq0y8d1cz9pajp8c4b84lslycq02kcrzi6nn73"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-bindgen" ,rust-bindgen-0.53)
         ("rust-cfg-if" ,rust-cfg-if-1)
         ("rust-cmake" ,rust-cmake-0.1)
         ("rust-flate2" ,rust-flate2-1)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-pkg-config" ,rust-pkg-config-0.3)
         ("rust-vcpkg" ,rust-vcpkg-0.2)
         ("rust-version-compare" ,rust-version-compare-0.1))))
    (home-page "https://github.com/rust-sdl2/rust-sdl2")
    (synopsis "Raw SDL2 bindings for Rust, used internally rust-sdl2")
    (description "Raw SDL2 bindings for Rust, used internally rust-sdl2")
    (license license:expat)))

(define-public rust-raw-window-handle-0.4
  (package
    (name "rust-raw-window-handle")
    (version "0.4.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "raw-window-handle" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1dr24lzairc9hdw2a8sk03vixzngv42y3qf9d0x2gmd9jkp5x9zv"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t #:cargo-inputs (("rust-cty" ,rust-cty-0.2))))
    (home-page "https://github.com/rust-windowing/raw-window-handle")
    (synopsis "Interoperability library for Rust Windowing applications.")
    (description "Interoperability library for Rust Windowing applications.")
    (license (list license:expat license:asl2.0 license:zlib))))

(define-public rust-c-vec-2
  (package
    (name "rust-c-vec")
    (version "2.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "c_vec" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1s765fviy10q27b0wmkyk4q728z9v8v5pdlxv5k564y0mlks9mzx"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/GuillaumeGomez/c_vec-rs.git")
    (synopsis "Structures to wrap C arrays")
    (description "Structures to wrap C arrays")
    (license (list license:asl2.0 license:expat))))

(define-public rust-sdl2-0.35
  (package
    (name "rust-sdl2")
    (version "0.35.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "sdl2" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "06ivcavxhc7zyhbfmy2544dz0lnaqf33d9xf0jggpw93nrvr55gp"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-bitflags" ,rust-bitflags-1)
         ("rust-c-vec" ,rust-c-vec-2)
         ("rust-lazy-static" ,rust-lazy-static-1)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-raw-window-handle" ,rust-raw-window-handle-0.4)
         ("rust-sdl2-sys" ,rust-sdl2-sys-0.35))
        #:cargo-development-inputs
        (("rust-env-logger" ,rust-env-logger-0.9)
         ("rust-pollster" ,rust-pollster-0.2)
         ("rust-rand" ,rust-rand-0.7)
         ("rust-wgpu" ,rust-wgpu-0.10))))
    (home-page "https://github.com/Rust-SDL2/rust-sdl2")
    (synopsis "SDL2 bindings for Rust")
    (description "SDL2 bindings for Rust")
    (license license:expat)))
