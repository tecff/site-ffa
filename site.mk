#
# GLUON_SITE_PACKAGES modular definition
#

# features
GLUON_FEATURES := \
	autoupdater \
	config-mode-domain-select \
	config-mode-geo-location-osm \
	ebtables-filter-multicast \
	ebtables-filter-ra-dhcp \
	ebtables-source-filter \
	mesh-batman-adv-15 \
	mesh-vpn-fastd \
	radvd \
	radv-filterd \
	respondd \
	state-check \
	status-page \
	web-advanced \
	web-private-wifi \
	web-wizard

# features for non-tiny standard devices - devices with >=7M flash and >=64M memory
GLUON_FEATURES_standard := \
	wireless-encryption-wpa3

# features for tiny devices - e.g. devices with <64M memory
GLUON_FEATURES_tiny := \
	-config-mode-geo-location-osm \
	-web-private-wifi

# base packages
GLUON_SITE_PACKAGES := \
	iwinfo \
	tecff-autoupdater-to-stable \
	tecff-autoupdater-wifi-fallback \
	tecff-banner \
	tecff-broken-wlan-workaround \
	tecff-button-bind \
	tecff-general-workaround \
	tecff-ssid-changer

# packages for non-tiny standard devices - devices with >=7M flash and >=64M memory
GLUON_SITE_PACKAGES_standard := \
	respondd-module-airtime \
	tecff-aptimeclock

# packages for tiny devices - e.g. devices with <64M memory
GLUON_SITE_PACKAGES_tiny := \
	-opkg

# basic support for USB stack
USB_PACKAGES_BASIC := \
	kmod-usb-core \
	kmod-usb-ohci \
	kmod-usb2 \
	kmod-usb3

NO_USB_PACKAGES_BASIC := \
	-kmod-usb-core \
	-kmod-usb-ledtrig-usbport \
	-kmod-usb-ohci \
	-kmod-usb2 \
	-kmod-usb3

# USB Serial
USB_PACKAGES_SERIAL := \
	kmod-usb-serial \
	kmod-usb-serial-ftdi \
	kmod-usb-serial-pl2303

NO_USB_PACKAGES_SERIAL := \
	-kmod-usb-serial \
	-kmod-usb-serial-ftdi \
	-kmod-usb-serial-pl2303

# support for USB input devices
USB_PACKAGES_HID := \
	kmod-usb-hid \
	kmod-hid-generic

# storage support for USB devices
USB_PACKAGES_STORAGE := \
	block-mount \
	blkid \
	kmod-fs-ext4 \
	kmod-fs-ntfs \
	kmod-fs-vfat \
	kmod-usb-storage \
	kmod-usb-storage-extras \
	kmod-nls-base \
	kmod-nls-cp1250 \
	kmod-nls-cp1251 \
	kmod-nls-cp437 \
	kmod-nls-cp775 \
	kmod-nls-cp850 \
	kmod-nls-cp852 \
	kmod-nls-cp866 \
	kmod-nls-iso8859-1 \
	kmod-nls-iso8859-13 \
	kmod-nls-iso8859-15 \
	kmod-nls-iso8859-2 \
	kmod-nls-koi8r \
	kmod-nls-utf8 \
	swap-utils

NO_USB_PACKAGES_STORAGE := \
	-block-mount \
	-blkid \
	-kmod-fs-ext4 \
	-kmod-fs-ntfs \
	-kmod-fs-vfat \
	-kmod-usb-storage \
	-kmod-usb-storage-extras \
	-kmod-nls-base \
	-kmod-nls-cp1250 \
	-kmod-nls-cp1251 \
	-kmod-nls-cp437 \
	-kmod-nls-cp775 \
	-kmod-nls-cp850 \
	-kmod-nls-cp852 \
	-kmod-nls-cp866 \
	-kmod-nls-iso8859-1 \
	-kmod-nls-iso8859-13 \
	-kmod-nls-iso8859-15 \
	-kmod-nls-iso8859-2 \
	-kmod-nls-koi8r \
	-kmod-nls-utf8 \
	-swap-utils

# network support for USB devices
USB_PACKAGES_NET := \
	kmod-ath9k-htc  \
	kmod-brcmfmac \
	kmod-carl9170 \
	kmod-mii \
	kmod-rt73-usb \
	kmod-rtl8192cu \
	kmod-rtl8187 \
	kmod-usb-net \
	kmod-usb-net-asix \
	kmod-usb-net-asix-ax88179 \
	kmod-usb-net-cdc-eem \
	kmod-usb-net-cdc-ether \
	kmod-usb-net-cdc-mbim \
	kmod-usb-net-cdc-ncm \
	kmod-usb-net-cdc-subset \
	kmod-usb-net-dm9601-ether \
	kmod-usb-net-hso \
	kmod-usb-net-huawei-cdc-ncm \
	kmod-usb-net-ipheth \
	kmod-usb-net-kalmia \
	kmod-usb-net-kaweth \
	kmod-usb-net-mcs7830 \
	kmod-usb-net-pegasus \
	kmod-usb-net-qmi-wwan \
	kmod-usb-net-rndis \
	kmod-usb-net-rtl8152 \
	kmod-usb-net-sierrawireless \
	kmod-usb-net-smsc95xx

NO_USB_PACKAGES_NET := \
	-kmod-ath9k-htc  \
	-kmod-brcmfmac \
	-kmod-carl9170 \
	-kmod-mii \
	-kmod-rt73-usb \
	-kmod-rtl8192cu \
	-kmod-rtl8187 \
	-kmod-usb-net \
	-kmod-usb-net-asix \
	-kmod-usb-net-asix-ax88179 \
	-kmod-usb-net-cdc-eem \
	-kmod-usb-net-cdc-ether \
	-kmod-usb-net-cdc-mbim \
	-kmod-usb-net-cdc-ncm \
	-kmod-usb-net-cdc-subset \
	-kmod-usb-net-dm9601-ether \
	-kmod-usb-net-hso \
	-kmod-usb-net-huawei-cdc-ncm \
	-kmod-usb-net-ipheth \
	-kmod-usb-net-kalmia \
	-kmod-usb-net-kaweth \
	-kmod-usb-net-mcs7830 \
	-kmod-usb-net-pegasus \
	-kmod-usb-net-qmi-wwan \
	-kmod-usb-net-rndis \
	-kmod-usb-net-rtl8152 \
	-kmod-usb-net-sierrawireless \
	-kmod-usb-net-smsc95xx

# PCI Network
PCI_PACKAGES_NET := \
	kmod-bnx2

# Group previous package sets
USB_PACKAGES_WITHOUT_HID := \
	usbutils \
	$(USB_PACKAGES_BASIC) \
	$(USB_PACKAGES_SERIAL) \
	$(USB_PACKAGES_STORAGE) \
	$(USB_PACKAGES_NET)

NO_USB_PACKAGES_WITHOUT_HID := \
	-usbutils \
	$(NO_USB_PACKAGES_BASIC) \
	$(NO_USB_PACKAGES_SERIAL) \
	$(NO_USB_PACKAGES_STORAGE) \
	$(NO_USB_PACKAGES_NET)

USB_PACKAGES := \
	$(USB_PACKAGES_HID) \
	$(USB_PACKAGES_WITHOUT_HID)

PCI_PACKAGES := \
	pciutils \
	kmod-usb-ohci-pci \
	$(PCI_PACKAGES_NET)

TLS_PACKAGES := \
	ca-bundle \
	libustream-mbedtls \
	wget-ssl

NO_TLS_PACKAGES := \
	-ca-bundle \
	-libustream-mbedtls \
	-wget-ssl

# x86 specific packages (more space available)
X86_PACKAGES := \
	$(USB_PACKAGES) \
	$(PCI_PACKAGES) \
	$(TLS_PACKAGES) \
	bash

#
# $(GLUON_TARGET) specific settings:
#

# ath79-generic
ifeq ($(GLUON_TARGET),ath79-generic)
	GLUON_SITE_PACKAGES += \
		$(USB_PACKAGES_WITHOUT_HID)

	# lowmem or no usb port
	GLUON_alfa-network-ap121f_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_avm-fritz-wlan-repeater-300e_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_avm-fritz-wlan-repeater-450e_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_d-link-dap-1330-a1_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_d-link-dap-1365-a1_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_d-link-dap-2660-a1_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_d-link-dir825b1_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_devolo-wifi-pro-1200e_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_devolo-wifi-pro-1200i_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_devolo-wifi-pro-1750c_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_devolo-wifi-pro-1750e_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_devolo-wifi-pro-1750i_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_devolo-wifi-pro-1750x_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_enterasys-ws-ap3705_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_joy-it-jt-or750i_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_ocedo-koala_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_ocedo-raccoon_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_openmesh-a40_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_openmesh-a60_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_openmesh-mr1750-v1_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_openmesh-mr1750-v2_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_openmesh-mr600-v1_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_openmesh-mr600-v2_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_openmesh-mr900-v1_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_openmesh-mr900-v2_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_openmesh-om2p-hs-v1_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_openmesh-om2p-hs-v2_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_openmesh-om2p-hs-v3_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_openmesh-om2p-hs-v4_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_openmesh-om2p-lc_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_openmesh-om2p-v1_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_openmesh-om2p-v2_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_openmesh-om2p-v4_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_openmesh-om5p_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_openmesh-om5p-ac-v1_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_openmesh-om5p-ac-v2_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_openmesh-om5p-an_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_plasma-cloud-pa300_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_plasma-cloud-pa300e_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_siemens-ws-ap3610_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_teltonika-rut230-v1_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_tp-link-archer-c2-v3_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_tp-link-archer-c6-v2-eu-ru-jp_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_tp-link-cpe210-v1_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_tp-link-cpe210-v2_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_tp-link-cpe210-v3_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_tp-link-cpe220-v3_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_tp-link-cpe510-v1_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_tp-link-cpe510-v2_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_tp-link-cpe510-v3_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_tp-link-cpe710-v1_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_tp-link-eap225-outdoor-v1_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_tp-link-re355-v1_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_tp-link-re450-v1_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_tp-link-tl-wr810n-v1_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_tp-link-tl-wr1043n-v5_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_tp-link-wbs210-v1_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_tp-link-wbs210-v2_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_tp-link-wbs510-v1_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_ubiquiti-nanostation-loco-m-xw_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_ubiquiti-nanostation-m-xw_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
# device not yet supported in ath79 but formerly supported in ar71xx
#	GLUON_ubiquiti-rocket-m_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_ubiquiti-unifi-ac-lite_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_ubiquiti-unifi-ac-lr_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_ubiquiti-unifi-ac-pro_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_ubiquiti-unifi-ac-mesh_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_ubiquiti-unifi-ac-mesh-pro_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_ubiquiti-unifiap-outdoor+_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_ubiquiti-unifi-ap_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_ubiquiti-unifi-ap-pro_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
endif

# ath79-nand
ifeq ($(GLUON_TARGET),ath79-nand)
	GLUON_SITE_PACKAGES += \
		$(USB_PACKAGES_WITHOUT_HID)
endif

# ipq40xx-generic
ifeq ($(GLUON_TARGET),ipq40xx-generic)
	GLUON_SITE_PACKAGES += \
		$(USB_PACKAGES_WITHOUT_HID) \
		$(TLS_PACKAGES)

	# no USB port
	GLUON_aruba-ap-303_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_aruba-ap-303h_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_aruba-ap-365_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_avm-fritz-repeater-1200_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_engenius-ens620ext_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_gl.inet-gl-ap1300_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_netgear-ex6100v2_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_netgear-ex6150v2_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
endif

# ipq40xx-mikrotik
ifeq ($(GLUON_TARGET),ipq40xx-mikrotik)
	GLUON_SITE_PACKAGES += \
		$(USB_PACKAGES_WITHOUT_HID) \
		$(TLS_PACKAGES)
	GLUON_mikrotik-sxtsq-5-ac-rbsxtsqg-5acd_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
endif

# ipq806x-generic
ifeq ($(GLUON_TARGET),ipq806x-generic)
	GLUON_SITE_PACKAGES += \
		$(USB_PACKAGES_WITHOUT_HID) \
		$(TLS_PACKAGES)
endif

# lantiq-xrx200
ifeq ($(GLUON_TARGET),lantiq-xrx200)
	GLUON_SITE_PACKAGES += \
		$(USB_PACKAGES_WITHOUT_HID)
endif

# lantiq-xway
ifeq ($(GLUON_TARGET),lantiq-xway)
	GLUON_SITE_PACKAGES += \
		$(USB_PACKAGES_WITHOUT_HID)
endif

# mpc85xx-p1010
ifeq ($(GLUON_TARGET),mpc85xx-p1010)
	GLUON_SITE_PACKAGES += \
		$(USB_PACKAGES_WITHOUT_HID) \
		$(TLS_PACKAGES)
endif

# mpc85xx-p1020
ifeq ($(GLUON_TARGET),mpc85xx-p1020)
	GLUON_SITE_PACKAGES += \
		$(USB_PACKAGES_WITHOUT_HID) \
		$(TLS_PACKAGES)
endif

# mvebu-cortexa9
ifeq ($(GLUON_TARGET),mvebu-cortexa9)
	GLUON_SITE_PACKAGES += \
		$(USB_PACKAGES_WITHOUT_HID) \
		$(TLS_PACKAGES)
endif

# mediatek-mt7622
ifeq ($(GLUON_TARGET),mediatek-mt7622)
	GLUON_SITE_PACKAGES += \
		$(USB_PACKAGES_WITHOUT_HID) \
		$(TLS_PACKAGES)

	# no USB port
	GLUON_ubiquiti-unifi-6-lr_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_xiaomi-redmi-router-ax6s_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
endif

# ramips-mt7620
ifeq ($(GLUON_TARGET),ramips-mt7620)
	GLUON_SITE_PACKAGES += \
		$(USB_PACKAGES_WITHOUT_HID) \
		$(TLS_PACKAGES)

	# image too big with USB packages
	GLUON_netgear-ex3700_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID) $(NO_TLS_PACKAGES)
	GLUON_nexx-wt3020-8m_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID) $(NO_TLS_PACKAGES)
	GLUON_tp-link-archer-c20-v1_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID) $(NO_TLS_PACKAGES)
	GLUON_tp-link-archer-c2-v1_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID) $(NO_TLS_PACKAGES)
	GLUON_tp-link-archer-c50-v1_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID) $(NO_TLS_PACKAGES)
	GLUON_tp-link-archer-c20i_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID) $(NO_TLS_PACKAGES)
endif

# ramips-mt7621
ifeq ($(GLUON_TARGET),ramips-mt7621)
	GLUON_SITE_PACKAGES += \
		$(USB_PACKAGES_WITHOUT_HID) \
		$(TLS_PACKAGES)

	# no USB port
	GLUON_cudy-wr2100_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_cudy-x6-v1_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_cudy-x6-v2_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_d-link-dap-x1860-a1_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_mercusys-mr70x-v1_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_netgear-ex6150_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_netgear-wac104_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_netgear-wax202_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_tp-link-re500-v1_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_tp-link-re650-v1_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_ubiquiti-edgerouter-x_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_ubiquiti-edgerouter-x-sfp_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_ubiquiti-unifi-6-lite_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_xiaomi-mi-router-3g-v2_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_xiaomi-mi-router-4a-gigabit-edition_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_zyxel-nwa50ax_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
endif

# ramips-mt76x8
ifeq ($(GLUON_TARGET),ramips-mt76x8)
	GLUON_SITE_PACKAGES += \
		$(USB_PACKAGES_WITHOUT_HID)

	# no USB port
	GLUON_cudy-wr1000_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_gl.inet-vixmini_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_netgear-r6020_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_tp-link-archer-c20-v5_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_tp-link-archer-c50-v3_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_tp-link-archer-c50-v4_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_tp-link-archer-c50-v5_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_tp-link-re200-v3_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_tp-link-re305_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_tp-link-tl-wa801nd-v5_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_tp-link-tl-wr841n-v13_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_xiaomi-mi-router-4a-100m-edition_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_xiaomi-mi-router-4a-100m-international-edition_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_xiaomi-mi-router-4c_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
endif

# Raspberry Pi A/B/B+
ifeq ($(GLUON_TARGET),bcm27xx-bcm2708)
	GLUON_SITE_PACKAGES += \
		$(USB_PACKAGES) \
		$(TLS_PACKAGES)
endif

# Raspberry Pi 2
ifeq ($(GLUON_TARGET),bcm27xx-bcm2709)
	GLUON_SITE_PACKAGES += \
		$(USB_PACKAGES) \
		$(TLS_PACKAGES)
endif

# Raspberry Pi 3
ifeq ($(GLUON_TARGET),bcm27xx-bcm2710)
	GLUON_SITE_PACKAGES += \
		$(USB_PACKAGES) \
		$(TLS_PACKAGES)
endif

# sunxi-cortexa7
ifeq ($(GLUON_TARGET),sunxi-cortexa7)
	GLUON_SITE_PACKAGES += \
		$(USB_PACKAGES) \
		$(TLS_PACKAGES)
endif

# x86-64
ifeq ($(GLUON_TARGET),x86-64)
	GLUON_SITE_PACKAGES += \
		$(X86_PACKAGES)
endif

# x86-generic
ifeq ($(GLUON_TARGET),x86-generic)
	GLUON_SITE_PACKAGES += \
		$(X86_PACKAGES)
endif

# x86-geode
ifeq ($(GLUON_TARGET),x86-geode)
	GLUON_SITE_PACKAGES += \
		$(X86_PACKAGES)
endif

# x86-legacy
ifeq ($(GLUON_TARGET),x86-legacy)
	GLUON_SITE_PACKAGES += \
		$(X86_PACKAGES)
endif


#
# General settings
#

DEFAULT_GLUON_RELEASE := snapshot~$(shell date '+%Y%m%d')

# Allow overriding the release number from the command line
GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)

# Default priority for updates.
GLUON_PRIORITY ?= 0

# Region code required for some images; supported values: us eu
GLUON_REGION ?= eu

# Languages to include
GLUON_LANGS ?= en de

# Only build sysupgrade images for deprecated devices.
GLUON_DEPRECATED ?= upgrade

# Enable multidomain support
GLUON_MULTIDOMAIN := 1
