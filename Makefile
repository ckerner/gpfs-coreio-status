COREHN=ifio01
WORKDIR=/data/motd

GPFSDIR=$(shell dirname $(shell which mmlscluster))
CURDIR=$(shell pwd)
LOCLDIR=/usr/local/bin

install: get_core_info cron

update: get_core_info gpfs_status

get_core_info:   .FORCE
	cp -pf $(CURDIR)/get_core_info $(LOCLDIR)/get_core_info
	sed -i "s/MYHEADNODE/$(COREHN)/g" $(LOCLDIR)/get_core_info
	sed -i "s~MYWORKDIR~$(WORKDIR)~g" $(LOCLDIR)/get_core_info

gpfs_status:
	cp -pf $(CURDIR)/gpfs_status.sh /etc/profile.d/gpfs_status.sh
	sed -i "s~MYWORKDIR~$(WORKDIR)~g" /etc/profile.d/gpfs_status.sh

clean:
	rm -f $(LOCLDIR)/get_core_info
	rm -f /etc/profile.d/gpfs_status.sh

cron:   .FORCE
	echo ' ' >>/var/spool/cron/root
	echo '# Collect GPFS Core I/O Server Stats ' >>/var/spool/cron/root
	echo '5,20,35,50 * * * * /usr/local/bin/get_core_info' >>/var/spool/cron/root


.FORCE:


