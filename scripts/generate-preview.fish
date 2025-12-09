#!/usr/bin/env fish

mkdir -p preview
for file in *.typ
    typst compile $file
    set basename (path basename --no-extension $file)
    pdftoppm -singlefile -scale-to 400 -png $basename.pdf > preview/$basename.png
end
