#!/bin/bash
if [ $RESTORE_JENKINS = true ]
then
	sudo chmod 755 /scripts/restore-jenkins.sh
	sudo sed -i s/BUCKETNAME/$BUCKET_NAME/g /scripts/restore-jenkins.sh
	echo "@reboot root /scripts/restore-jenkins.sh &" | sudo tee -a /etc/crontab
fi
if [ $BACKUP_JENKINS = true ]
then
	sudo chmod 755 /scripts/backup-jenkins.sh
	sudo mkdir /var/lib/jenkins/scripts
	sudo chmod 755 /var/lib/jenkins/scripts
	sudo chown jenkins:jenkins /var/lib/jenkins/scripts
	sudo sed -i s/BUCKETNAME/$BUCKET_NAME/g /scripts/backup-jenkins.sh
	sudo mv /scripts/backup-jenkins.sh /var/lib/jenkins/scripts/
	sudo chown jenkins:jenkins /var/lib/jenkins/scripts/backup-jenkins.sh
fi
