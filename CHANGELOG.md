# Freifunk Altdorf Firmware Changelog

## v2016.2.4
 - Updated to Gluon 2016.2.4 (see upstream release notes!)
   - Changes: https://gluon.readthedocs.org/en/v2016.2.4/releases/v2016.2.4.html
 - Updated site.conf
   - change TLD of openwrt opkg download proxy
   - add static IPv4 & IPv6 addresses for fastd instances
   - remove setting mesh_on_wan (is optional anyway)

## v2016.2.3.1
 - disable ibss/adhoc meshing standard (replaced by 802.11s)
 - fix sysupgrade on some systems (e.g. sdcard storage)

## v2016.2.3
 - Updated to Gluon 2016.2.3 (see upstream release notes!)
   - Changes: https://gluon.readthedocs.org/en/v2016.2/releases/v2016.2.html
   - Changes: https://gluon.readthedocs.org/en/v2016.2.1/releases/v2016.2.1.html
   - Changes: https://gluon.readthedocs.org/en/v2016.2.2/releases/v2016.2.2.html
   - Changes: https://gluon.readthedocs.org/en/v2016.2.3/releases/v2016.2.3.html
 - Updated site.conf
    - activate 802.11s meshing standard parallel to ibss/adhoc
    - add supported and basic rates to configuration
    - remove update probability (obsolete since gluon 2016.1.x)
 - activate support for 802.11s mesh on ath10k devices, e.g. Archer C7 & Unifi AP AC
 - add confirmation request if contact or location are left blank in config-mode
 - add migration of experimental nodes to stable branch
 - add more NIC drivers to support e.g. IGEL UD5-2
 - add support for flashing over vendor firmwares with region codes
 - add USB1 device driver on x86
 - add USB3 driver on x86
 - improve descriptions for hostname, contact-info & geo-location in config-mode
 - remove respondd-watchdog (fixed upstream)
 - remove ssh password option from config-mode
 - workaround for problems with ath9k wifi driver: start only every 10 minutes

## v2016.1.6
 - Updated to Gluon 2016.1.6
   - Changes: https://gluon.readthedocs.org/en/v2016.1.6/releases/v2016.1.6.html
 - Updated site.conf
   - add 2 additional placeholder fastd gws
   - add 6th firmware signture key & replace one
   - add option `additional_prefix6` (used by ebtables firewall)
   - add repository for kernel modules for each build
   - change domain for OpenWRT package downloads
   - hide altitude field in config mode
   - increase size of `prefix4` to /19
 - add autoupdater fallback mode (uses wifi client mode)
 - add autoupdater improvements from master branch
 - add kmod-igb NIC driver, used e.g. on APU2
 - add package for time-based (de-)activation of bandwidth limits
 - add package for time-based (de-)activation of the client SSID
 - add usb network drivers to more devices with enough space
 - add watchdog package for crashing respondd
 - improve workaround for problems with ath9k wifi driver
 - improve Makefile: job count handling
 - stronger ebtables firewall with tecff-ebtables-net-rules
 - move external packages into tecff package feed & rename to avoid conflicts
 - remove gluon-treatment
 - remove gluon-alfred
 - remove tools from build as manual installation is easy

## v2016.1.5.2
 - improve workaround package/script for problems with ath9k wifi driver

## v2016.1.5.1
 - improve workaround package/script for problems with ath9k wifi driver

## v2016.1.5
 - Updated to Gluon 2016.1.5, includes 2016.1.4
   - Changes: https://gluon.readthedocs.org/en/v2016.1.4/releases/v2016.1.4.html
   - Changes: https://gluon.readthedocs.org/en/v2016.1.5/releases/v2016.1.5.html
 - use the additional packages for D-Link DIR-505
 - add workaround package/script for problems with ath9k wifi driver
 - add package for special treatment of nodes
 - remove support for 802.11b wifi
 - remove support for slow wifi connections
 - Update site.conf
   - enable fastd mesh vpn by default
   - add NTP servers IPv6 addresses as no-DNS-fallback 

## v2016.1.3
 - Updated to Gluon 2016.1.3
   - Changes: https://gluon.readthedocs.org/en/v2016.1.3/releases/v2016.1.3.html
 - support for rtl8152 network chip used in USB networking devices

## v2016.1.2
 - Updated to Gluon 2016.1.2
   - Changes: https://gluon.readthedocs.org/en/v2016.1.2/releases/v2016.1.2.html
 - support for TP-Link TL-WA7510N
 - support for Raspberry Pi A/B/B+/2
 - support for several additional USB networking devices

## v2016.1.1
 - Updated to Gluon 2016.1.1
   - Changes: https://gluon.readthedocs.org/en/v2016.1.1/releases/v2016.1.1.html
 - add preserve wifi channels feature

## v2016.1
 - Updated to Gluon 2016.1
   - Changes: https://gluon.readthedocs.org/en/v2016.1/releases/v2016.1.html
 - Update site.conf
   - change default ESSID to Freifunk
   - raise number of necessary signatures for sysupgrade images
   - Set batman gw selection class to 3 (fast switch)
   - reduce dependencies regarding firmware updates
   - reduce dependencies regarding gateway connections
   - change MTU to 1280 (solves issues with IPv6 & DS-Lite)
   - allow IPv6 for gateway connections
 - add gluon-ssid-changer: nodes with bad TQ change their ESSID
 - add x86-64 build-target
 - add support for several USB devices
 - add support for Futro devices (useful offloader)
 - use custom banner file

## v2015.7
 - replace dev-Gateway-Hostnames by currently not-in-use stable ones
 - add signing key for Buildserver

## v2015.6.4.1
 - add support for TP-Link TL-WR1043ND v3

## v2015.6.4
 - Makefile added mpc85xx-generic for powerPC based Router
 - Replaced Munich specifics with Altdorf

## v2015.5
 - Updated to Gluon 2015.1.1
   - Fixes some problems with mesh on LAN setups
 - x86 images now support two network interfaces, eth0 for LAN and eth1 for WAN
 - Mesh on WAN is disabled by default
 - VPN connection limit was decreased from 2 to 1 to divide the broadcast traffic
   into half and take unnecessary load from overloaded gateways

## v2015.4 [never released]
 - Updated to Gluon 2015.1
   - More supported architectures and router models are available, including x86
 - Setup Mode
   - A new wifi configuration page is available to disable client and mesh
     networks on 2.4 & 5GHz indiviually
   - Mesh on WAN can now be configured and is enabled by default
   - Internationalization for German and English is available and will
     be autodetected depending on the browser setting

## v2015.3
 - Add 4 new gateways as placeholders (not all are and will be active immediately)
 - Integrated no_rebroadcast fix on mesh-vpn from Gluon Upstream
 - Added another key for stable version signing

## v2015.2
 - Updated to new upstream gluon: 52698e62bac2ec0f8764b12cf437040528e77efb
 - Switched to batman-adv compat version 15
 - Changed channel to 6 with HT20 on 2.4GHz
 - Added FFMuc custom gluon packages with ebtables rules:
   - mcast-drop-non-site to prohibit arp traffic except 10.8.0.0/16
   - mcast-drop-arp to drop arp traffic from/to 0.0.0.0
   - mcast-allow-cjdns to allow cjdns multicast traffic
 - Use new gateways with DNS names
 - Changed default download/upload traffic shaping to 12.000/1.200 kbit/s
 - Removed keyformular note on end of luci configuration, as we're now
   blacklisting keys instead of whitelisting
 - Added information about liquid feedback on end of luci configuration
 - Use improved version naming scheme for autoupdater compatibility with
   intermediate versions
 - Use internal NTP server 0.ntp.ffmuc.net
 - Connections from nodes to gateways only over IPv4 for now (MTU issues)

## v2015.1
 - Updated to Gluon 2014.4 release
 - Autoupdater
   - Now enabled per default
   - Also fetch firmware from build.freifunk-muenchen.de
   - Require two signatures instead of one for stable autoupdate

## snapshot~20141119
 - fixed ipv4-prefix to /16 netmask
 - changed gateways ips to domain-names
 - changed `msg_pub_key` to automate entering the node-data to our key-form
 - changed mesh-SSID from 02:0E:8E:1E:61:17 to mesh.ffm
 - added `ntp_servers` '2.ntp.services.ffm','3.ntp.services.ffm','4.ntp.services.ffm'
 - changed `site_code` back to ffmuc (instead of ffm)
 - changed `hostname_prefix` to NULL
 - changed `mesh_ssid` to mesh.ffmuc
 - added public key from fpletz

## 0.6~stable20141018
 - changed ip address for gw02

## 0.6~stable20141011
 - gw04 hinzugefügt
 - Text "Knoten hinzufügen" geändert
 - Autoupdater auf "stable" als Standart-Wert gesetzt

## 0.6~exp20141004
 - Autoupdater hinzugefügt

## 0.6~exp20140926
 - Bugfixes
 - gw02 hinzugefügt

## 0.6~exp20140907
 - initiale Version
