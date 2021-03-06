#!/bin/bash
#======================================================================#
# get_coreio_info - Collect basic info from the GPFS Core I/O Servers. #
#----------------------------------------------------------------------#
# Chad Kerner - chad.kerner@gmail.com - ckerner@illinois.edu           #
# Senior Storage Engineer, Storage Enabling Technologies               #
# National Center for Supercomputing Applications                      #
# University of Illinois, Urbana-Champaign                             #
#======================================================================#

# Only display something if we are on a real terminal.
if [ ! -n "$TMUX" ] ; then 
   WORKDIR=MYWORKDIR

   echo " "
   date
   echo " "
   cat ${WORKDIR}/gpfs.manager
   cat ${WORKDIR}/gpfs.state
   echo " "
   cat ${WORKDIR}/uptime.*
   echo " "

fi
