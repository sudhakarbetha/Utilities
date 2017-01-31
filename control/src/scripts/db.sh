#This is a Utility for Database instance - start/stop

#Show Usage on Failure 
function usage()
{
	echo "Usage:"
    echo "To start, run as $ sh db.sh start"
    echo "To stop, run as $ sh db.sh stop"
    exit 1
}

#Start DB 
function start_db()
{
echo "Starting Database"
$ORACLE_HOME/bin/sqlplus 'sys/welcome1 as sysdba'  <<eof
startup
select name from v$services
alter pluggable database all open
quit
eof
}

#Stop DB 
function stop_db()
{
echo "Stopping Database"
$ORACLE_HOME/bin/sqlplus 'sys/welcome1 as sysdba'  <<eof
shutdown immediate
quit
eof
}

#Main Program starts here
if [ $# == 0 ]
then
        usage
fi

ACTION=$1
export ORACLE_HOME=/scratch/sbetha/Database/product/12.1.0/dbhome_1
export ORACLE_SID=orcl
export LISTENER=$ORACLE_HOME/bin/lsnrctl

echo "ORACLE_HOME=$ORACLE_HOME"
echo "ORACLE_SID=$ORACLE_SID"

if [ "$ACTION" == "start" ]
 then
        start_db
	
		echo "Starting Listener - $LISTENER start"
		$LISTENER start
		echo "Getting Listener status - $LISTENER status"
		$LISTENER status


elif [ "$ACTION" == "stop" ]
 then
		stop_db
		
		echo "Getting Listener status - $LISTENER status"
		$LISTENER status
		echo "Stopping Listener - $LISTENER stop"
		$LISTENER stop
		
else
        echo "Unknown Operation $ACTION"
	usage
fi

echo "Done Action=$ACTION"
