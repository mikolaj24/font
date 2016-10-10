all: test.pdf

litery.600pk: litery.600gf
	gftodvi litery.600gf
	gftopk litery.600gf litery.600pk

litery.tfm: litery.mf
	mf '\mode=ljfour; mode_setup; input litery.mf'

test.dvi: test.tex litery.tfm litery.600pk
	latex test.tex

test.pdf: test.dvi litery.tfm litery.600pk
	dvipdf test.dvi

push:
	git cm ",,,,"`git rev-list --full-history --all --abbrev-commit --count`.`date +%Y%m%d` ; git push --all ; git push --all mirek

clean:
	rm -f *.aux *.log *.dvi *.*pk *.*[0-9]gf *.tfm *.pdf
