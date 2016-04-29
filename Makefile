all: Makefile.coq
	+make -f Makefile.coq all

clean: Makefile.coq
	+make -f Makefile.coq clean
	rm -f Makefile.coq

Makefile.coq: Make
ifeq ($(USE_GIT_SUBMODULES),yes)
	# This is what we have to do if we cannot rely on things installed via OPAM
	$(COQBIN)coq_makefile -f Make -o Makefile.coq -R int-map IntMap
else
	# This is what we do if we can rely on things installed via OPAM
	$(COQBIN)coq_makefile -f Make -o Makefile.coq
endif

%: Makefile.coq
	+make -f Makefile.coq $@

.PHONY: all clean
