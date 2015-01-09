# Install OCaml and OPAM PPAs
case "$OCAML_VERSION" in
  4.01.0) ppa=avsm/ocaml41+opam12 ;;
  4.02.1) ppa=avsm/ocaml41+opam12 ;;
  4.02.1+doc) ppa=avsm/ocaml41+opam12 ;;
  *) echo Unknown $OCAML_VERSION; exit 1 ;;
esac

echo "yes" | sudo add-apt-repository ppa:$ppa
sudo apt-get update -qq
sudo apt-get install -qq ocaml ocaml-native-compilers camlp4-extra opam time

echo OCaml version
ocaml -version

export OPAMYES=1

opam init git://github.com/ocaml/opam-repository >/dev/null 2>&1
opam repo add platform .

case "$OCAML_VERSION" in
  4.01.0)
    opam install opam-publish
    opam install ocaml-org ;;
  4.02.1)
    opam switch 4.02.1
    opam install opam-publish
    opam install ocaml-org ;;
  4.02.1+doc)
    opam switch 4.02.1+doc
    opam install opam-publish
    opam install opam-doc-base
    opam install ocaml-org ;;
  *)
    echo "Nothing to do";
    exit 1 ;;
esac
