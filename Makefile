JL = julia --project=.

all: init serve

init:
	$(JL) -e 'using Pkg; Pkg.instantiate()'

serve:
	$(JL) -e 'using Franklin; serve()'