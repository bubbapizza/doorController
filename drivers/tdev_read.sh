#
# tdev_read.sh
# 20131030 -tm
#
# read the TDEV tty emulation device

DV="./tdev"
CF="./tdev.card"    		# this is the ouput to the card file
DTTM="date +%Y%m%d_%H%M"    	# date time macro

while [ 1 = 1 ]
 do
   #
   while read PORT 
     do
        PORT1="$PORT"
        #echo $PORT
   done < $DV
   #
   # on exit it's because the dev is done reading
   #
   # clean up spurious characters
   # only if 
   echo "`${DTTM}`:${PORT1}" > $CF
   #
done
