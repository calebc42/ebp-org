#!/bin/sh
set -eu

cd "$(dirname "$0")/.."
ebp_el_dir=${EBP_EL_DIR:-"$(pwd)/../ebp.el"}
test -r "$ebp_el_dir/lisp/ebp-path.el" || {
  echo "ebp.el not found at $ebp_el_dir" >&2
  exit 2
}

compile_dir=$(mktemp -d)
trap 'rm -rf "$compile_dir"' EXIT
emacs -Q --batch -L "$ebp_el_dir/lisp" -L lisp \
  --eval "(progn
    (setq load-prefer-newer t byte-compile-error-on-warn t)
    (setq byte-compile-dest-file-function
          (lambda (file)
            (expand-file-name
             (concat (file-name-nondirectory file) \"c\")
             \"$compile_dir\"))))" \
  -f batch-byte-compile lisp/ebp-org.el

emacs -Q --batch -L "$ebp_el_dir/lisp" -L lisp -L test \
  --eval '(setq load-prefer-newer t)' \
  -l test/ebp-org-test.el -f ert-run-tests-batch-and-exit
