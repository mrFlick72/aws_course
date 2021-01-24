#!/bin/bash

sudo yum update -y
sudo amazon-linux-extras install -y java-openjdk11
# TODO
export BUCKET_FOLDER_KEY="put year your folder key"

aws s3 cp s3://${BUCKET_FOLDER_KEY}/autoscaling-java-helloworld.jar  /usr/local/autoscaling-java-helloworld/autoscaling-java-helloworld.jar

sudo bash -c 'cat << EOF > /lib/systemd/system/autoscaling-java-helloworld.service
[Unit]
Description=autoscaling-java-helloworld application systemd service
After=multi-user.target

[Service]
Type=idle
ExecStart=/usr/bin/java -jar /usr/local/autoscaling-java-helloworld/autoscaling-java-helloworld.jar
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF'

sudo chmod 644 /lib/systemd/system/autoscaling-java-helloworld.service
sudo systemctl daemon-reload
sudo systemctl enable autoscaling-java-helloworld.service
sudo systemctl start autoscaling-java-helloworld.service

