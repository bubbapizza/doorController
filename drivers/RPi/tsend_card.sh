#!/bin/sh

#
# tsend_card.sh
# 20131030 -tm
#
# simulate Parallax card  proximity transmission
#
#
#    1.   open two windows in a current session, one will be Reader
#         the other Writer
#
#    2.   mknod tdev p        # create a pipe device (1 time only)
#
#    3.   invoke the tdev_read.sh in the Reader Window
#
#    4.   from the Writer window do:     echo "testreader" > ./tdev
# 
#    6.   the echoed contents should be displayed in the Reader window 
#
#    
#
# usage:    tsend_card.sh  cardid  [ no. of times to xmit ]
#
#
#   sends the pattern in first parm 1 timee to the tdev device unless it's
#   supplied a second parm indicating the number of repetitions
#
DV="./tdev"       # ASSUME Reader and Writer process in same directory

if [ ! -p $DV ]; then    # no pipe file 
  echo -e "\n\tNo pipe device:  $DV found!\n"
  exit 1
fi 

if [ $# -eq 0 ]; then  # no parms passed
  echo -e "\n\n"
  echo -e "\tUsage:   tsend_card.sh CARD_ID [ no. of times to send ]"
  echo -e "\n\n"
  exit 0
fi
 
CARDID="${1}"

if [ "$2_" = "_" ]; then 
   NTS=1
else
   NTS=${2}
fi

echo " sending card:  $CARDID  for:  $NTS passes"

while [ $NTS -gt 0 ]
  do
    #
    # \n = 0x0A =NewLIne
    # \r = 0x0D =Return
    #   --simulate wrapping the CARDID the way Parallax RFID transmits it
    #
    echo -e "\n${CARDID}\r" > $DV
    NTS=`expr $NTS - 1`
    #
done 
   
