format:
    fd --extension typ --exec typstyle -i --line-width 120
    fd --extension bib --exec biblatex-formatter -i
    fd --extension drawio --exec xmllint --format --output {} {}
    fd --extension pdf --exec qpdf --warning-exit-0 --linearize --replace-input
    fd --extension png --exec oxipng
