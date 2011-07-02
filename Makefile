.PHONY:	clean all view

TARGET		=	main
SOURCES		=	category.tex kleisli.tex main.tex functor.tex introduction.tex\
				nattrans.tex
DIAGRAMS	=	diag_functor.pdf diag_nt.pdf diag_nt2.pdf diag_comp.pdf\
				diag_dom.pdf diag_kleisli.pdf
RM			=	rm

.SUFFIXES:	.bb .pdf

all: $(TARGET).pdf

clean:
	$(RM) $(TARGET).pdf
	$(RM) *.bb
	$(RM) *.aux
	$(RM) *.log

view: $(TARGET).pdf
	open $(TARGET).pdf

.pdf.bb:
	ebb $<

$(DIAGRAMS:.pdf=.bb): $(DIAGRAMS)

$(TARGET).pdf: $(SOURCES) $(DIAGRAMS) $(DIAGRAMS:.pdf=.bb)
	platex $(TARGET).tex
	dvipdfmx $(TARGET).dvi
