COMMAND = pandoc
FILTERS = $(foreach filter,$(wildcard filters/*.lua),--lua-filter $(filter))
CSS = $(foreach css,$(wildcard css/*.css),--metadata css=$(css))
ARGS = --from gfm --to html5+smart --standalone $(FILTERS) $(CSS) --toc --template template
SRC_DIR = docs
BUILD_DIR = build

all: $(patsubst $(SRC_DIR)/%.md,$(BUILD_DIR)/%.html,$(wildcard $(SRC_DIR)/*.md)) Makefile

$(BUILD_DIR)/%.html: $(SRC_DIR)/%.md | build_dir
	$(COMMAND) $(ARGS) \
	--metadata title="$(subst -, ,$(patsubst $(SRC_DIR)/%.md,%,$<))" \
	--metadata date=$(shell git log -n 1 --pretty=format:%ct -- $<) \
	$< --output $@

build_dir:
	@mkdir $(BUILD_DIR)

clean:
	@rm -rf $(BUILD_DIR)
