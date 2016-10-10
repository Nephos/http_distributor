FLAGS = --stats

all: release
run:
	crystal run ./src/http_distributor.cr
build:
	crystal build $(FLAGS) ./src/http_distributor.cr
release:
	crystal build $(FLAGS) ./src/http_distributor.cr --release
clean:
	@echo "nothing to clean"
update:
	shards update
install:
	shards install
	@echo "warning: this is not a system install"
