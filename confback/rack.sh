HADOOP_CONF=/home/hadoop/hadoop-20/conf

 while [ $# -gt 0 ] ; do
   nodeArg=$1
   exec< ${HADOOP_CONF}/rack_info.txt
   result=""
   while read line ; do
     ar=( $line )
     if [ "${ar[0]}" = "$nodeArg" ] ; then
       result="${ar[1]}"
     fi
   done
   shift
   if [ -z "$result" ] ; then
     echo -n "/default/rack "
   else
     echo -n "$result "
   fi

 done
