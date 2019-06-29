all:
	@true
install-common:
	mkdir -p $(DESTDIR)/usr/lib/qubes/
	install network/publish-bridge $(DESTDIR)/usr/lib/qubes/

install-networking:
	install -d $(DESTDIR)/etc/network/if-up.d/
	install -d $(DESTDIR)/etc/network/if-down.d/
	ln -sf /usr/lib/qubes/publish-bridge $(DESTDIR)/etc/network/if-up.d/
	ln -sf /usr/lib/qubes/publish-bridge $(DESTDIR)/etc/network/if-down.d/

install-networkmanager:
	install -d $(DESTDIR)/etc/NetworkManager/dispatcher.d/pre-up.d/
	install -d $(DESTDIR)/etc/NetworkManager/dispatcher.d/pre-down.d/
	ln -sf /usr/lib/qubes/publish-bridge $(DESTDIR)/etc/NetworkManager/dispatcher.d/pre-up.d/
	ln -sf /usr/lib/qubes/publish-bridge $(DESTDIR)/etc/NetworkManager/dispatcher.d/pre-down.d/

install-vm: install-common install-networkmanager

install-rh: install-vm

install-deb: install-vm install-networking
