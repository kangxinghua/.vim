del "%USERPROFILE%\.vimrc"
mklink /H "%USERPROFILE%\.vimrc" ".vimrc"

del "%USERPROFILE%\.ideavimrc"
mklink /H "%USERPROFILE%\.ideavimrc" ".ideavimrc"

git submodule init

git submodule update
