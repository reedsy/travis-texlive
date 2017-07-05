#!/usr/bin/env bash

set -e

get_platform () {
  case "$OSTYPE" in
    darwin*) echo "darwin" ;;
    linux*)  echo "linux" ;;
    *)       echo "Unsupported platform" >&2; exit -1 ;;
  esac
}


TARGET_DIR=$PWD/texlive
rm -rf $TARGET_DIR

PROFILE=texlive.profile

cat > $PROFILE <<END_CAT
# texlive.profile generated on 2017-07-05
selected_scheme scheme-custom
TEXDIR $TARGET_DIR
TEXMFHOME $TARGET_DIR/texmf
TEXMFLOCAL $TARGET_DIR/texmf-local
TEXMFCONFIG $TARGET_DIR/texmf-config
TEXMFSYSCONFIG $TARGET_DIR/texmf-config
TEXMFVAR $TARGET_DIR/texmf-var
TEXMFSYSVAR $TARGET_DIR/texmf-var
binary_x86_64-darwin 0
binary_x86_64-linux 1
collection-basic 1
collection-bibtexextra 1
collection-binextra 1
collection-context 1
collection-fontsextra 1
collection-fontsrecommended 1
collection-fontutils 1
collection-formatsextra 1
collection-games 1
collection-humanities 1
collection-langafrican 0
collection-langarabic 0
collection-langchinese 0
collection-langcjk 0
collection-langcyrillic 0
collection-langczechslovak 0
collection-langenglish 0
collection-langeuropean 0
collection-langfrench 0
collection-langgerman 1
collection-langgreek 0
collection-langindic 0
collection-langitalian 0
collection-langjapanese 0
collection-langkorean 0
collection-langother 0
collection-langpolish 0
collection-langportuguese 0
collection-langspanish 0
collection-latex 1
collection-latexextra 1
collection-latexrecommended 1
collection-luatex 1
collection-mathscience 1
collection-metapost 1
collection-music 1
collection-pictures 1
collection-plaingeneric 1
collection-pstricks 1
collection-publishers 1
collection-texworks 0
collection-wintools 0
collection-xetex 1
option_adjustrepo 1
option_autobackup 0
option_desktop_integration 0
option_doc 0
option_file_assocs 0
option_fmt 1
option_letter 0
option_path 0
option_post_code 1
option_src 0
option_sys_bin /usr/local/bin
option_sys_man /usr/local/share/man
option_sys_info /usr/local/share/info
option_w32_multi_user 0
option_write18_restricted 1
portable 1
END_CAT

rm -f installation.profile
install-tl-*/install-tl -profile $PROFILE

# Install individual packages...
PATH="$TARGET_DIR/bin/x86_64-$(get_platform):$PATH"
tlmgr install glossaries pdfx algorithms algorithmicx siunitx


rm -rf $TARGET_DIR/texmf-dist/doc
rm -rf $TARGET_DIR/texmf-dist/source
rm -f texlive.tar.xz

echo "Creating tarball..."
XZ_OPT=-9 tar cJf texlive.tar.xz texlive
