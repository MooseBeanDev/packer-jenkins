#!/bin/bash
sudo aws s3 sync s3://BUCKETNAME/jenkins /var/lib/jenkins
sudo chmod 755 -R /var/lib/jenkins
sudo chown jenkins:jenkins -R /var/lib/jenkins
