JL = julia --project=.

all: init serve

init:
	$(JL) -e 'using Pkg; Pkg.instantiate()'

update:
	$(JL) -e 'using Pkg; Pkg.update()'

serve:
	$(JL) -e 'using Franklin; serve()'
