
.PHONY: build watch clean

all: build

build: index.html index.css font.css

FILES := $(shell find sass -type f)

index.css: ${FILES}
	@sass sass/index.sass index.css

font.css: sass/font.scss
	@sass sass/font.scss font.css

watch:
	@find sass index.html font.scss -type f \
		| entr -s 'clear && ${MAKE} -B'

docker: Dockerfile $(shell find sass -type f)
	@docker build -t afafk/adelfunpro.au .
	@touch docker

clean:
	@rm -f *.css *.css.map
