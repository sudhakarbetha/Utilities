#This is a Utility to start or stop Artifactory

function usage()
{
    echo "Usage:"
    echo "To start, run as $ sh artifactory.sh start"
    echo "To stop, run as $ sh artifactory.sh stop"
    exit 1
}

if [ $# == 0 ]
then
	usage
fi
ACTION=$1


#Look at $ARTIFACTORY_HOME/bin/artifactory.default for JDK Settings
export ARTIFACTORY_HOME="/scratch/sbetha/artifactory-oss-4.8.2"


if [ "$ACTION" == "start" ]
 then
	echo "STARTING ARTIFACTORY"
        echo "$ARTIFACTORY_HOME/bin/artifactoryctl start"
        $ARTIFACTORY_HOME/bin/artifactoryctl $ACTION
elif [ "$ACTION" == "stop" ]
 then
	echo "STOPPING ARTIFACTORY"
 	echo "$ARTIFACTORY_HOME/bin/artifactoryctl stop"
        $ARTIFACTORY_HOME/bin/artifactoryctl $ACTION
else
        echo "Unknown Operation $ACTION"
	usage
fi
echo "Done Action=$ACTION"
echo "Access artifactory over : http://den00rni:8081/artifactory with login admin/password"

