# Install OCaml and OPAM PPAs
case "$OCAML_VERSION,$OPAM_VERSION" in
  4.00.1,1.1.0) ppa=avsm/ocaml40+opam11 ;;
  4.01.0,1.1.0) ppa=avsm/ocaml41+opam11 ;;
  4.02.0,1.1.0) ppa=avsm/ocaml41+opam11 ;;
  4.02.0+doc,1.1.0) ppa=avsm/ocaml41+opam11 ;;
  *) echo Unknown $OCAML_VERSION,$OPAM_VERSION; exit 1 ;;
esac

echo "yes" | sudo add-apt-repository ppa:$ppa
sudo apt-get update -qq
sudo apt-get install -qq ocaml ocaml-native-compilers camlp4-extra opam time

echo OCaml version
ocaml -version

export OPAMYES=1
export OPAMVERBOSE=1

opam init git://github.com/ocaml/opam-repository >/dev/null 2>&1
opam repo add platform .

case "$OCAML_VERSION," in
  4.02.0+doc) opam swith 4.02+doc ;;
esac

opam install opam-doc-base
opam install opam-org
