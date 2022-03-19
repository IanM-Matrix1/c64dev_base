PETCAT = petcat
KICKASS_JAR = KickAssembler/KickAss.jar
C1541 = c1541

CLEAN_TARGETS = *.sym bcd.prg-vice.log *.prg *.d64
BASIC_BASE_ADDR = 0801

all : disk.d64

simpleprog.prg : simpleprog.bas support.sym
support.prg : support.asm
disk.d64 : simpleprog.prg support.prg

# Nothing will usually need to change below here

%.prg %.sym : %.asm
	java -jar $(KICKASS_JAR) $<

%.prg : %.bas
	bin/basic_preproc -o $<.tmp $<
	#cat $<.tmp
	$(PETCAT) -w2 -o $@ -l $(BASIC_BASE_ADDR) -- $<.tmp
	$(RM) $<.tmp

%.d64 :
	$(C1541) -format "$@,id" d64 $@ $(foreach root,$^,-write $(root) $(subst .prg,,$(root)))

clean :
	$(RM) $(CLEAN_TARGETS)

.PHONY : all clean
