
# BUILD_FLAGS=--pedantic --library-profiling --executable-profiling
BUILD_FLAGS=--pedantic
PORT=8080

RUN=stack exec -- not-doing

run: build
	$(RUN) --port $(PORT)

init: stack.yaml

stack.yaml:
	stack init --prefer-nightly

docs:
	stack haddock
	open `stack path --local-doc-root`/index.html

# package:
# build a release tarball or executable
#
# dev:
# start dev server or process. `vagrant up`, `yesod devel`, etc.
#
# deploy:
# prep and push

configure:
	cabal configure \
		--package-db=clear \
		--package-db=global \
		--package-db=`stack path --snapshot-pkg-db` \
		--package-db=`stack path --local-pkg-db`

install:
	stack install

tags: $(SRC)
	codex update

hlint:
	hlint *.hs src specs

clean:
	stack clean
	codex cache clean

distclean: clean
	rm stack.yaml

build: static/css/style.css static/js/main.js
	stack build $(BUILD_FLAGS)

static/css/style.css: sass/style.scss
	sass $(SASS_OPTIONS) $< $@

static/js/main.js: purs/Main.purs
	pulp build --src-path purs/ --to $@

watch-sass:
	sass --watch sass/style.scss:static/css/style.css

watch-purs:
	pulp --watch browserify --src-path purs/ --to static/js/main.js

test:
	stack test $(BUILD_FLAGS)

bench:
	stack bench $(BUILD_FLAGS)

watch:
	ghcid "--command=stack ghci"

watch-test:
	stack test --file-watch --pedantic # --test-arguments "-m TODO"

restart: distclean init build

rebuild: clean build

.PHONY: init run docs configure install hlint clean distclean build test
.PHONY: bench watch watch-test restart rebuild
