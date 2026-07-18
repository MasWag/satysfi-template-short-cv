.PHONY: all clean

all: image/short-cv.svg

short-cv.pdf: short-cv.saty short-cv.satyh portrait.pdf
	satysfi short-cv.saty -o short-cv.pdf

image/short-cv.svg: short-cv.pdf
	mkdir -p image
	pdf2svg short-cv.pdf image/short-cv.svg

clean:
	$(RM) short-cv.pdf image/short-cv.svg
