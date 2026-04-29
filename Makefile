PDFS = ai-template.pdf app-template.pdf softec-template.pdf tm-template.pdf

.PHONY: all build format clean

all: build

build: $(PDFS)

%.pdf: %.typ
	typst compile $< $@

format:
	find . -type f -name "*.typ" -exec typstyle -i --line-width 120 {} \;
	find . -type f -name "*.bib" -exec biblatex-formatter -i {} \;
	find . -type f -name "*.drawio" -or -name "*.svg" -exec xmllint --format --output {} {} \;
	find . -type f -name "*.pdf" -exec qpdf --warning-exit-0 --linearize --replace-input {} \;
	find . -type f -name "*.png" -exec oxipng --opt 6 {} +

clean:
	rm -f $(PDFS)
