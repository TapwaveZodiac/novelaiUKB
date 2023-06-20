COMMAND = pandoc
FILTERS = $(foreach filter,$(wildcard filters/*.lua),--lua-filter $(filter))
ARGS = --from gfm --to html --standalone $(FILTERS) --toc
SRC_DIR = docs
BUILD_DIR = build

all: $(patsubst $(SRC_DIR)/%.md,$(BUILD_DIR)/%.html,$(wildcard $(SRC_DIR)/*.md)) Makefile

$(BUILD_DIR)/%.html: $(SRC_DIR)/%.md | build
	$(COMMAND) $(ARGS) $< --output $@

build:
	@mkdir $(BUILD_DIR)

clean:
	@rm -rf $(BUILD_DIR)
