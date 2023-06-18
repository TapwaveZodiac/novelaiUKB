COMMAND = pandoc
ARGS = --from gfm --to html --standalone
SRC_DIR = docs
BUILD_DIR = build

all: $(patsubst $(SRC_DIR)/%.md,$(BUILD_DIR)/%.html,$(wildcard $(SRC_DIR)/*.md)) Makefile

$(BUILD_DIR)/%.html: $(SRC_DIR)/%.md | build
	$(COMMAND) $(ARGS) $< --output $@

build:
	@mkdir $(BUILD_DIR)
