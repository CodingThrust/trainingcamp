JL = julia --project=.

serve:
	$(JL) -e 'using Franklin; serve()'