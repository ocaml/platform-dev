all:
	rsync -arv --exclude prepare `opam config var share`/ocaml-org/ .
