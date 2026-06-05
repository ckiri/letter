doc ?= template
MAIN = ./main.tex
BUILD_DIR = ./build
CONTENT_DIR = ./content/
ENGINE = pdflatex

.PHONY: all clean build_dir

all: pdf

build_dir:
	@mkdir -p $(BUILD_DIR)

pdf: $(MAIN) $(CONTENT_DIR) build_dir
	$(ENGINE) -output-directory=$(BUILD_DIR) -jobname=$(doc) "\def\doc{$(doc)} \input{$(MAIN)}"

clean: $(BUILD_DIR)
	@rm -rf $(BUILD_DIR)/*
