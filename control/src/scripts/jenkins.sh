#This is a Utility for jenkins instance

function usage()
{
    echo "Usage:"
    echo "To start, run as $ sh jenkins.sh start"
    echo "To stop, run as $ sh jenkins.sh stop"
    exit 1
}

if [ $# == 0 ]
 then
	usage
fi

ACTION=$1
export JAVA_HOME="/scratch/sbetha/Shiphomes/Java/jdk7"
export CATALINA_HOME="/scratch/sbetha/Tomcat/jenkins_tomcat"
export JENKINS_HOME="/scratch/sbetha/Tomcat/jenkins_home"
export JAVA_OPTIONS="-Xms1024M -Xmx4096M -XX:PermSize=1024M -XX:MaxPermSize=4096M"
if [ "$ACTION" == "start" ]
 then
        echo "$CATALINA_HOME/bin/catalina.sh start"
        $CATALINA_HOME/bin/catalina.sh start
elif [ "$ACTION" == "stop" ]
 then
        echo "$CATALINA_HOME/bin/catalina.sh stop"
        $CATALINA_HOME/bin/catalina.sh stop
else
        echo "Unknown Operation $ACTION"
        usage
fi

echo "Done Action=$ACTION"

