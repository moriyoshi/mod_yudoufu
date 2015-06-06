mod_yudoufu.la: mod_yudoufu.slo yudoufu_handler.lo httpd.lo b~yudoufu_handler.lo
	$(SH_LINK) -rpath $(libexecdir) -module -avoid-version  mod_yudoufu.lo yudoufu_handler.lo httpd.lo b~yudoufu_handler.lo -lgnat
DISTCLEAN_TARGETS = modules.mk
shared =  mod_yudoufu.la
ADA_COMPILER = gcc
GNATBIND = gnatbind

yudoufu_handler.lo yudoufu_handler.ali: yudoufu_handler.adb
	$(LIBTOOL) --mode=compile $(ADA_COMPILER) -c $<

httpd.lo: httpd.adb
	$(LIBTOOL) --mode=compile $(ADA_COMPILER) -c $< 

b~yudoufu_handler.adb: yudoufu_handler.ali
	$(GNATBIND) -n $<

b~yudoufu_handler.lo: b~yudoufu_handler.adb
	$(LIBTOOL) --mode=compile $(ADA_COMPILER) -c $<
