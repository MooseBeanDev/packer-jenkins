#!/bin/bash
sudo aws s3 sync /var/lib/jenkins s3://$BUCKET_NAME/jenkins --delete --no-follow-symlinks
