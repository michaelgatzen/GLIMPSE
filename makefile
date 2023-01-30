projects = chunk concordance ligate phase split_reference

COMPILATION_ENV = docker

.PHONY: all $(projects)

all: $(projects)

$(projects):
	$(MAKE) -C $@ $(COMPILATION_ENV)

clean:
	for dir in $(projects); do \
	$(MAKE) $@ -C $$dir; \
	done

