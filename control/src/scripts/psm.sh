
#This is a Utility for psm instance
if [ $# == 0 ]
then
        echo "Usage:"
        echo "To start, run as $ sh psm.sh start"
        echo "To stop, run as $ sh psm.sh stop"
    exit 1
fi

ACTION=$1
export BASE_INSTALL="/scratch/sbetha/psm_12c"
export MW_HOME="$BASE_INSTALL/MW"
export SM_DOMAIN="$BASE_INSTALL/SM_DOMAIN"
export SM_KIT_HOME="$BASE_INSTALL/smkit"
export PSM_HOME="$BASE_INSTALL/PSM12c"

if [ "$ACTION" == "start" ]
 then
        echo "$MW_HOME/ocpsm/bin/sm-start-domain.sh"
        $MW_HOME/ocpsm/bin/sm-start-domain.sh
elif [ "$ACTION" == "stop" ]
 then
        echo "$MW_HOME/ocpsm/bin/sm-stop-domain.sh"
        $MW_HOME/ocpsm/bin/sm-stop-domain.sh
else
        echo "Unknown Operation $ACTION"
        exit 1
fi
echo "Done Action=$ACTION"
