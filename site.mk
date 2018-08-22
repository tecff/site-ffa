#
# GLUON_SITE_PACKAGES modular definition
#

# features
GLUON_FEATURES := \
	autoupdater \
	ebtables-filter-multicast \
	ebtables-filter-ra-dhcp \
	ebtables-limit-arp \
	ebtables-source-filter \
	mesh-batman-adv-15 \
	mesh-vpn-fastd \
	radvd \
	radv-filterd \
	respondd \
	status-page \
	web-advanced \
	web-private-wifi \
	web-wizard

# base packages
GLUON_SITE_PACKAGES := \
	haveged \
	iwinfo \
	tecff-ath9k-broken-wifi-workaround \
	tecff-autoupdater-to-stable \
	tecff-autoupdater-wifi-fallback \
	tecff-banner \
	tecff-general-workaround \
	tecff-ssid-changer

# misc packages, only on devices with 8MB flash and 64MB memory (or more)
MISC_PACKAGES := \
	respondd-module-airtime \
	tecff-aptimeclock \
	tecff-vpnlimittimeclock

NO_MISC_PACKAGES := \
	-respondd-module-airtime \
	-tecff-aptimeclock \
	-tecff-vpnlimittimeclock

# basic support for USB stack
USB_PACKAGES_BASIC := \
	kmod-usb-core \
	kmod-usb-ohci \
	kmod-usb2 \
	kmod-usb3

NO_USB_PACKAGES_BASIC := \
	-kmod-usb-core \
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

# x86 specific packages (more space available)
X86_PACKAGES := \
	$(PCI_PACKAGES) \
	bash \
	wget-nossl

#
# $(GLUON_TARGET) specific settings:
#

# ar71xx-generic
ifeq ($(GLUON_TARGET),ar71xx-generic)
	GLUON_SITE_PACKAGES += \
		$(USB_PACKAGES_WITHOUT_HID) \
		$(MISC_PACKAGES)

	# TP-Link Archer C25 v1
	GLUON_tp-link-archer-c25-v1_SITE_PACKAGES += tecff-archer-c25

	# lowmem or no usb port
	GLUON_alfa-network-hornet-ub_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_alfa-network-tube2h_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_d-link-dir-615-h1_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_tp-link-tl-wr842n-nd-v1_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID) $(NO_MISC_PACKAGES) -opkg
	GLUON_tp-link-tl-wr842n-nd-v2_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID) $(NO_MISC_PACKAGES) -opkg
	GLUON_tp-link-tl-wr1043n-nd-v1_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID) $(NO_MISC_PACKAGES) -opkg
	GLUON_tp-link-wbs210-v1.20_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_tp-link-wbs510-v1.20_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_tp-link-cpe210-v1.0_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_tp-link-cpe510-v1.0_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_tp-link-re450_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_linksys-wrt160nl_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_meraki-mr12_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_meraki-mr16_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_netgear-wnr2200_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_openmesh-mr1750_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_openmesh-mr600_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_openmesh-mr900_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_openmesh-om2p_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_openmesh-om5p-ac_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_openmesh-om5p_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_ubiquiti-airgateway_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_ubiquiti-airgateway-pro_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_ubiquiti-airrouter_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_ubiquiti-bullet-m_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID) $(NO_MISC_PACKAGES) -opkg
	GLUON_ubiquiti-loco-m-xw_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID) $(NO_MISC_PACKAGES) -opkg
	GLUON_ubiquiti-ls-sr71_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_ubiquiti-nanostation-m_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID) $(NO_MISC_PACKAGES) -opkg
	GLUON_ubiquiti-nanostation-m-xw_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID) $(NO_MISC_PACKAGES) -opkg
	GLUON_ubiquiti-rocket-m_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_ubiquiti-rocket-m-ti_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_ubiquiti-rocket-m-xw_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_ubiquiti-unifi-ac-lite_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_ubiquiti-unifi-ac-pro_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_ubiquiti-unifiap-outdoor_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_ubiquiti-unifiap-outdoor+_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_ubiquiti-unifi-ap-pro_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_ubiquiti-unifi_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
endif

# ar71xx-mikrotik
ifeq ($(GLUON_TARGET),ar71xx-mikrotik)
	GLUON_SITE_PACKAGES += \
		$(USB_PACKAGES_WITHOUT_HID) \
		$(MISC_PACKAGES)
endif

# ar71xx-nand
ifeq ($(GLUON_TARGET),ar71xx-nand)
	GLUON_SITE_PACKAGES += \
		$(USB_PACKAGES_WITHOUT_HID) \
		$(MISC_PACKAGES)
endif

# ipq40xx
ifeq ($(GLUON_TARGET),ipq40xx)
	GLUON_SITE_PACKAGES += \
		$(USB_PACKAGES_WITHOUT_HID) \
		$(MISC_PACKAGES)
endif

# ipq806x
ifeq ($(GLUON_TARGET),ipq806x)
	GLUON_SITE_PACKAGES += \
		$(USB_PACKAGES_WITHOUT_HID) \
		$(MISC_PACKAGES)
endif

# mpc85xx-generic
ifeq ($(GLUON_TARGET),mpc85xx-generic)
	GLUON_SITE_PACKAGES += \
		$(USB_PACKAGES_WITHOUT_HID) \
		$(MISC_PACKAGES)
endif

# mvebu-cortexa9
ifeq ($(GLUON_TARGET),mvebu-cortexa9)
	GLUON_SITE_PACKAGES += \
		$(USB_PACKAGES_WITHOUT_HID) \
		$(MISC_PACKAGES)
endif

# ramips-mt7620
ifeq ($(GLUON_TARGET),ramips-mt7620)
	GLUON_SITE_PACKAGES += \
		$(USB_PACKAGES_WITHOUT_HID) \
		$(MISC_PACKAGES)
endif

# ramips-mt7621
ifeq ($(GLUON_TARGET),ramips-mt7621)
	GLUON_SITE_PACKAGES += \
		$(USB_PACKAGES_WITHOUT_HID) \
		$(MISC_PACKAGES)

	# no USB port
	GLUON_ubnt-erx_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
	GLUON_ubnt-erx-sfp_SITE_PACKAGES += $(NO_USB_PACKAGES_WITHOUT_HID)
endif

# ramips-mt76x8
ifeq ($(GLUON_TARGET),ramips-mt76x8)
	GLUON_SITE_PACKAGES += \
		$(USB_PACKAGES_WITHOUT_HID) \
		$(MISC_PACKAGES)
endif

# ramips-rt305x
ifeq ($(GLUON_TARGET),ramips-rt305x)
	GLUON_SITE_PACKAGES += \
		$(USB_PACKAGES_WITHOUT_HID) \
		$(MISC_PACKAGES)
endif

# Raspberry Pi A/B/B+
ifeq ($(GLUON_TARGET),brcm2708-bcm2708)
	GLUON_SITE_PACKAGES += \
		$(USB_PACKAGES) \
		$(MISC_PACKAGES)
endif

# Raspberry Pi 2
ifeq ($(GLUON_TARGET),brcm2708-bcm2709)
	GLUON_SITE_PACKAGES += \
		$(USB_PACKAGES) \
		$(MISC_PACKAGES)
endif

# Raspberry Pi 3
ifeq ($(GLUON_TARGET),brcm2708-bcm2710)
	GLUON_SITE_PACKAGES += \
		$(USB_PACKAGES) \
		$(MISC_PACKAGES)
endif

# sunxi-cortexa7
ifeq ($(GLUON_TARGET),sunxi-cortexa7)
	GLUON_SITE_PACKAGES += \
		$(USB_PACKAGES) \
		$(MISC_PACKAGES)
endif

# x86-64
ifeq ($(GLUON_TARGET),x86-64)
	GLUON_SITE_PACKAGES += \
		$(USB_PACKAGES) \
		$(MISC_PACKAGES) \
		$(X86_PACKAGES)
endif

# x86-generic
ifeq ($(GLUON_TARGET),x86-generic)
	GLUON_SITE_PACKAGES += \
		$(USB_PACKAGES) \
		$(MISC_PACKAGES) \
		$(X86_PACKAGES)
endif

# x86-geode
ifeq ($(GLUON_TARGET),x86-geode)
	GLUON_SITE_PACKAGES += \
		$(USB_PACKAGES) \
		$(MISC_PACKAGES) \
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
