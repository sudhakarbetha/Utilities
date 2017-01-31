# Ths is a Utility to start/stop CloudViewer

function usage()
{
    echo "Usage:"
    echo "To start, run as $ sh tomcat.sh start"
    echo "To stop, run as $ sh tomcat.sh stop"
    exit 1
}

if [ $# == 0 ]
then
	usage
fi

ACTION=$1
export JAVA_HOME="/scratch/sbetha/Shiphomes/Java/jdk7"
export CATALINA_HOME="/scratch/sbetha/Tomcat/tomcat_new"
export CATALINA_BASE="/scratch/sbetha/Tomcat/tomcat_new"
export JAVA_OPTIONS="-Xms1024M -Xmx4096M -XX:PermSize=1024M -XX:MaxPermSize=4096M"
if [ "$ACTION" == "start" ] 
 then
	echo "$CATALINA_HOME/bin/startup.sh"
	$CATALINA_HOME/bin/startup.sh
elif [ "$ACTION" == "stop" ]
 then
	echo "$CATALINA_HOME/bin/shutdown.sh"
	$CATALINA_HOME/bin/shutdown.sh
else
	echo "Unknown Operation $ACTION"
	usage
fi
echo "Done Action=$ACTION"
