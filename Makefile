.PHONY:	clean all view

TARGET		=	category
DIAGRAMS	=	diag_functor.pdf diag_nt.pdf diag_nt2.pdf diag_comp.pdf\
				diag_dom.pdf diag_kleisli.pdf
RM			=	rm

.SUFFIXES:	.bb .pdf

all: category.pdf

clean:
	$(RM) category.pdf
	$(RM) *.bb
	$(RM) *.aux
	$(RM) *.log

view: $(TARGET).pdf
	open $(TARGET).pdf

.pdf.bb:
	ebb $<

$(DIAGRAMS:.pdf=.bb): $(DIAGRAMS)

$(TARGET).pdf: $(TARGET).tex $(DIAGRAMS) $(DIAGRAMS:.pdf=.bb)
	platex $(TARGET).tex
	dvipdfmx $(TARGET).dvi
