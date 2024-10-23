MOD_NAME = backgrounds_and_events
TAG_NAME =''
SOURCES = hackflows scripts gfx brushes
DATA_DIR = ~/.local/share/Steam/steamapps/common/Battle\ Brothers/data/

SHELL := /bin/bash

.ONESHELL:
test: genfiles check-compile
	@squirrel tests/run.nut

zip: check-compile
	@set -e;
	LAST_TAG=$$(git tag | grep $(TAG_NAME) | tail -1);
	echo $$LAST_TAG;
	MODIFIED=$$( git diff $$LAST_TAG --quiet $(SOURCES) || echo _MODIFIED);
	FILENAME=mod_$(MOD_NAME)_$${LAST_TAG}$${MODIFIED}.zip;
	zip --filesync -r "$${FILENAME}" $(SOURCES);

clean:
	@rm -f *_MODIFIED.zip;

install: check-compile
	@set -e;
	FILENAME=$(DATA_DIR)mod_$(MOD_NAME)_TMP.zip;
	zip --filesync -r "$${FILENAME}" $(SOURCES);

check-compile:
	@set -e
	find . -name \*.nut -print0 | xargs -0 -n1 squirrel -c && echo "Syntax OK"
	rm out.cnut

genfiles:
	find hackflows scripts -type f -print \
		| perl -nE 'BEGIN{say "return ["}chomp;say "    \"$$_\"";END{say "]"}' > tests/_files.nut
