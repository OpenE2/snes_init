CFLAGS =-O2 -Wall $(pkg-config --cflags --libs directfb) -I=${includedir}/directfb

all: snes_init

snes_init: snes_init.cpp
	$(CC) -I=${includedir}/c++ -I=${includedir}/c++/mipsel-oe-linux $(CFLAGS) -DSNES_STANDALONE snes_init.cpp -o $@ -ldirectfb

clean:
	-@rm -rf snes_init)


%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@


prefix=/usr/local
install: snes_init
	install -D -m 0755 snes_init $(DESTDIR)$(prefix)/bin/snes_init

.PHONY: all clean install

.SILENT: clean