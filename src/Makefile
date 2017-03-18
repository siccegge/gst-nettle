#!/usr/bin/make -f

HASH = NettleRipeMd160.st NettleMd4.st NettleSha1.st NettleMd5.st NettleSha2.st
MAC = NettleHmac.st
PRIVKEY = NettleSymmetricCipher.st NettleAes.st NettleTwofish.st
SOURCES = $(HASH) $(MAC) $(PRIVKEY) Nettle.st NettleBase64.st NettleCbc.st
TESTS = $(wildcard tests/*.st)


check: $(SOURCES) $(TESTS)
	gst-sunit $(patsubst %,-f %,$(SOURCES) $(TESTS)) $(patsubst tests/%.st,%,$(TESTS))
