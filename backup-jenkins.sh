#!/bin/bash
sudo aws s3 sync /var/lib/jenkins s3://BUCKETNAME/jenkins --delete --no-follow-symlinks
