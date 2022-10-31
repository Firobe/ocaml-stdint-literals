(lang dune 2.8)
(name stdint-literals)

(version 1.0)

(generate_opam_files true)

(source (github Firobe/ocaml-stdint-literals))
(license MIT)
(authors "Virgile Robles")
(maintainers "virgile.robles@pm.me")

(package
 (name stdint-literals)
 (synopsis "Small PPX for fixed size integer literals")
 (description "Small PPX for fixed size integer literals")
 (depends
   (ppxlib (>= 0.7.0))
   (dune :build)
   stdint))
