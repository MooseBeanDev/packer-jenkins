#!/bin/bash
#update push
sudo aws s3 sync /var/lib/jenkins s3://bmccown-jenkins/jenkins --delete --no-follow-symlinks
