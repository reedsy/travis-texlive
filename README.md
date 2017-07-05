# travis-texlive
Creates a TexLive archive to be used in Travis CI.

The following example show how the newest texlive distribution can be used:
```
before_install:
  - curl -L https://github.com/holgern/travis-texlive/releases/download/2017-07-05_07/texlive.tar.xz | tar -JxC ~
install:
  - PATH=$HOME/texlive/bin/x86_64-linux:$PATH
```

The following texlive.profile is used:
```
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
collection-langarabic 1
collection-langchinese 1
collection-langcjk 1
collection-langcyrillic 1
collection-langczechslovak 1
collection-langenglish 1
collection-langeuropean 1
collection-langfrench 1
collection-langgerman 1
collection-langgreek 1
collection-langitalian 1
collection-langjapanese 1
collection-langkorean 1
collection-langother 1
collection-langpolish 1
collection-langportuguese 1
collection-langspanish 1
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
```
