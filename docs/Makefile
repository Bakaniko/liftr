.PHONY: mrproper clean info help
.DEFAULT_GOAL= help

help:
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-10s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

info: ## display user ID, user group and current working directory
	echo $(ID)
	echo $(GP)
	echo $(PWD)

all: ## make the pdf & clean after (alias to pdf)
	make pdf

pdf: ## make the pdf  & clean after
	## find custom Rscript command to build pdf
	mv document.pdf output.pdf
	make clean


clean: ## clean liftr files
	rm -f *.tex
	rm -f Dockerfile
	rm -f *.yml

mrproper: ## clean liftr files && pdfs files
	make clean
	rm -f *.pdf
