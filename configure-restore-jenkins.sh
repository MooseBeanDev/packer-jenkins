#!/bin/bash
if [ $RESTORE_JENKINS = true ]
then
	sudo chmod 755 /scripts/restore-jenkins.sh
	sudo sed -i s/BUCKETNAME/$BUCKET_NAME/g /scripts/restore-jenkins.sh
	echo "@reboot root /scripts/restore-jenkins.sh &" | sudo tee -a /etc/crontab
fi
