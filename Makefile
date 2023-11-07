MOD_NAME = hackflows
TAG_NAME = hx
SOURCES = hackflows scripts gfx brushes
DATA_DIR = ~/.local/share/Steam/steamapps/common/Battle\ Brothers/data/

SHELL := /bin/bash

.ONESHELL:
test: genfiles
	@squirrel tests/run.nut

zip: check-compile
	@LAST_TAG=$$(git tag | tail -1);
	MODIFIED=$$( git diff $$LAST_TAG --quiet $(SOURCES) || echo _MODIFIED);
	FILENAME=mod_$(MOD_NAME)$$([[ "$$LAST_TAG" != "" ]] && echo _$$LAST_TAG || echo "")$${MODIFIED}.zip;
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
	find hackflows scripts -type f -print | perl -nE 'BEGIN{say "return ["}chomp;print "\"";print;say"\""; END{say "]"}' > tests/_files.nut

# test:
# 	squirrel tests/run.nut
