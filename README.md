# Kickstart
Kickstart configuration files to support DISA STIG implementation during RHEL 7 OS install

default	- PXE configuration file
dhcpd.conf	- DHCP configuration file
kickstart_OpenSCAP_baseline_15Oct2018.ckl - STIG compliance baseline produced by ks.cfg.stig
ks.cfg.stig	- Kickstart configuraiton file with STIG implimentation
ks.cfg.vanilla- Kickstart configuration file for testing w/no security controls
makehash.sh	- Shell script that creates Kickstart compatible salted FIPS complient passwords
tftp	- TFTP configuration file

For Kickstart to work, you need to configure DHCP, TFTP, PXE, FTP/HTTP/NFS, and Kickstart.
