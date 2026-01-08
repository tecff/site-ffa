features({
		'autoupdater',
		'config-mode-domain-select',
		'config-mode-geo-location-osm',
		'ebtables-filter-multicast',
		'ebtables-filter-ra-dhcp',
		'ebtables-source-filter',
		'mesh-batman-adv-15',
		'mesh-vpn-fastd',
		'radvd',
		'radv-filterd',
		'respondd',
		'state-check',
		'status-page',
		'web-advanced',
		'web-private-wifi',
		'web-wizard',
		'wireless-encryption-wpa3',
})

packages({
	'iwinfo',
		'respondd-module-airtime',
		'tecff-aptimeclock',
		'tecff-autoupdater-to-stable',
		'tecff-autoupdater-wifi-fallback',
		'tecff-banner',
		'tecff-broken-wlan-workaround',
		'tecff-button-bind',
		'tecff-general-workaround',
		'tecff-ssid-changer',
})


if device_class('tiny') then
	features({
		'-config-mode-geo-location-osm',
		'-web-private-wifi',
		'-wireless-encryption-wpa3',
	})
	packages({
		'-respondd-module-airtime',
		'-tecff-aptimeclock',
	})
end

if device({
		'glinet-gl-xe300',
		'glinet-gl-ap1300',
		'tplink-tl-mr6400-v5',
		'wavlink-ws-wn572hp3-4g',
		'zte-mf281',
		'zte-mf286r',
		'zte-mf289f',
	}) then
	features {
		'web-cellular',
	}
end

pkgs_usb = {
	'usbutils',
}

pkgs_hid = {
	'kmod-usb-hid',
	'kmod-hid-generic',
}

pkgs_usb_serial = {
	'kmod-usb-serial',
	'kmod-usb-serial-ftdi',
	'kmod-usb-serial-pl2303',
}

pkgs_usb_storage = {
	'block-mount',
	'blkid',
	'kmod-fs-ext4',
	'kmod-fs-ntfs',
	'kmod-fs-vfat',
	'kmod-usb-storage',
	'kmod-usb-storage-extras',-- Card Readers
	'kmod-usb-storage-uas',	-- USB Attached SCSI (UAS/UASP)
	'kmod-nls-base',
	'kmod-nls-cp1250',	-- NLS Codepage 1250 (Eastern Europe)
	'kmod-nls-cp1251',
	'kmod-nls-cp437',	-- NLS Codepage 437 (United States, Canada)
	'kmod-nls-cp850',	-- NLS Codepage 850 (Europe)
	'kmod-nls-cp852',	-- NLS Codepage 852 (Europe)
	'kmod-nls-cp866',
	'kmod-nls-iso8859-1',	-- NLS ISO 8859-1 (Latin 1)
	'kmod-nls-iso8859-13',	-- NLS ISO 8859-13 (Latin 7; Baltic)
	'kmod-nls-iso8859-15',	-- NLS ISO 8859-15 (Latin 9)
	'kmod-nls-iso8859-2',	-- NLS ISO 8859-2 (Latin 2)
	'kmod-nls-koi8r',
	'kmod-nls-utf8',	-- NLS UTF-8
	'swap-utils',
}

pkgs_usb_net = {
	'kmod-ath9k-htc',
	'kmod-brcmfmac',
	'kmod-carl9170',
	'kmod-mii',
	'kmod-rt73-usb',
	'kmod-rtl8187',
	'kmod-rtl8192cu',
	'kmod-usb-net',
	'kmod-usb-net-asix',
	'kmod-usb-net-asix-ax88179',
	'kmod-usb-net-cdc-eem',
	'kmod-usb-net-cdc-ether',
	'kmod-usb-net-cdc-mbim',
	'kmod-usb-net-cdc-ncm',
	'kmod-usb-net-cdc-subset',
	'kmod-usb-net-dm9601-ether',
	'kmod-usb-net-hso',
	'kmod-usb-net-huawei-cdc-ncm',
	'kmod-usb-net-ipheth',
	'kmod-usb-net-kalmia',
	'kmod-usb-net-kaweth',
	'kmod-usb-net-mcs7830',
	'kmod-usb-net-pegasus',
	'kmod-usb-net-qmi-wwan',
	'kmod-usb-net-rndis',
	'kmod-usb-net-rtl8152',
	'kmod-usb-net-sierrawireless',
	'kmod-usb-net-smsc95xx',
}

pkgs_pci = {
	'pciutils',
	'kmod-bnx2', -- Broadcom NetExtreme BCM5706/5708/5709/5716
}

include_tls = not device({
	'd-link-dir825b1',
})

if include_tls then
	features({ 'tls' })
	packages({
		'openssh-sftp-server', -- for OpenSSH 9: https://www.openssh.com/txt/release-9.0
	})
end

include_usb = true

-- rtl838x has no USB support as of Gluon v2023.2
if target('realtek', 'rtl838x') then
	include_usb = false
end

-- exclude USB for ath79-generic except for a few devices
if target('ath79', 'generic') and not device({
	'gl.inet-gl-ar300m-lite',
	'gl.inet-gl-ar750',
	'joy-it-jt-or750i',
	'netgear-wndr3700-v2',
	'tp-link-archer-a7-v5',
	'tp-link-archer-c5-v1',
	'tp-link-archer-c7-v2',
	'tp-link-archer-c7-v5',
	'tp-link-archer-c59-v1',
	'tp-link-tl-wr842n-v3',
	'tp-link-tl-wr1043nd-v4',
}) then
	include_usb = false
end

-- not enough usable firmware space + USB port
if device({
	'cudy-wr1000',
	'gl-mt300n-v2',
	'netgear-ex3700',
	'nexx-wt3020-8m',
	'tp-link-archer-c20-v1',
	'tp-link-archer-c2-v1',
	'tp-link-archer-c50-v1',
	'tp-link-archer-c20i',
	'tp-link-td-w8970',
	'tp-link-td-w8980',
	'tp-link-tl-mr3020-v3',
	'tp-link-tl-mr3420-v5',
	'tp-link-tl-mr6400-v5',
	'tp-link-tl-wr902ac-v3',
}) then
	include_usb = false
end

-- devices without usb ports
if device({
	'aruba-ap-303',
	'aruba-ap-303h',
	'aruba-ap-365',
	'avm-fritz-box-7412',
	'avm-fritz-repeater-1200',
	'cudy-wr2100',
	'cudy-x6-v1',
	'cudy-x6-v2',
	'd-link-dap-x1860-a1',
	'engenius-ens620ext',
	'gl.inet-gl-ap1300',
	'gl.inet-microuter-n300',
	'gl.inet-vixmini',
	'mercusys-mr70x-v1',
	'mikrotik-sxtsq-5-ac-rbsxtsqg-5acd',
	'netgear-ex3700',
	'netgear-ex6100v2',
	'netgear-ex6130',
	'netgear-ex6150',
	'netgear-ex6150v2',
	'netgear-r6020',
	'netgear-wac104',
	'netgear-wax202',
	'tp-link-archer-c20-v4',
	'tp-link-archer-c20-v5',
	'tp-link-archer-c50-v3',
	'tp-link-archer-c50-v4',
	'tp-link-archer-c50-v5',
	'tp-link-eap615-wall-v1',
	'tp-link-re200-v2',
	'tp-link-re200-v3',
	'tp-link-re200-v4',
	'tp-link-re305',
	'tp-link-re500-v1',
	'tp-link-re650-v1',
	'tp-link-tl-mr6400-v1',
	'tp-link-tl-wa801nd-v5',
	'tp-link-tl-wr841n-v13',
	'ubiquiti-edgerouter-x',
	'ubiquiti-edgerouter-x-sfp',
	'ubiquiti-unifi-6-lr-v1',
	'wavlink-ws-wn572hp3-4g',
	'xiaomi-mi-router-3g-v2',
	'xiaomi-mi-router-4a-100m-edition',
	'xiaomi-mi-router-4a-100m-international-edition',
	'xiaomi-mi-router-4a-gigabit-edition',
	'xiaomi-mi-router-4c',
	'xiaomi-redmi-router-ax6s',
	'zyxel-nwa50ax',
	'zyxel-nwa55axe',
}) then
	include_usb = false
end

if include_usb then
	packages(pkgs_usb)
	packages(pkgs_usb_net)
	packages(pkgs_usb_serial)
	packages(pkgs_usb_storage)
end

if target('x86', '64') then
	packages {'qemu-ga'}
end

if target('x86') and not target('x86', 'legacy') then
	packages(pkgs_hid)
	packages(pkgs_pci)
end

if target('bcm27xx') then
	packages(pkgs_hid)
end


