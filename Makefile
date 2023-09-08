MOD_NAME = hackflows
TAG_NAME = hx
SOURCES = hackflows scripts gfx brushes
DATA_DIR = ~/.local/share/Steam/steamapps/common/Battle\ Brothers/data/

SHELL := /bin/bash

zip:
	LAST_TAG=$$(git tag | grep $(TAG_NAME) | tail -1); \
	MODIFIED=$$( git diff $$LAST_TAG --quiet $(SOURCES) || echo _MODIFIED); \
	NAME=$$(echo $$LAST_TAG | perl -pE 's/-/_/g'); \
	FILENAME=mod_$$([[ "$$NAME" != "" ]] && echo $$NAME || echo $(MOD_NAME))$${MODIFIED}.zip; \
	rm $${FILENAME}; \
	zip -r $${FILENAME} $(SOURCES)

install:
	FILENAME=mod_$(MOD_NAME)_TMP.zip; \
	rm $${FILENAME}; \
	zip -r $${FILENAME} $(SOURCES); \
	cp $${FILENAME} $(DATA_DIR)$${FILENAME}; \
	rm $${FILENAME}

genfiles:
	find hackflows scripts -type f -print | perl -nE 'BEGIN{say "return ["}chomp;print "\"";print;say"\""; END{say "]"}' > tests/_files.nut

test:
	squirrel tests/run.nut
