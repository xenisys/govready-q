#!/bin/bash

set -euf -o pipefail # abort script on error

# Defaults
##########
# Defaults
##########

# Docker machine name
DM_NAME="govready-q-sandbox"
AWS_REGION="us-east-1"

# The name for the newly run container. Set with
# --name NAME. If set to the empty string, no name
# is used. The default is:
# NAME=govready-q-0.9.0

# Parse command-line arguments
##############################

while [ $# -gt 0 ]; do
  case "$1" in
    --dm-name)
      DM_NAME="$2"
      shift 2 ;;
    --aws-regin)
      AWS_REGION="$2"
      shift 2 ;;
    --)
        shift
        break
        ;;
    *)
      echo "Unrecognized command line option: $1";
      exit 1;
    esac
done

WARNINGS=0

# Have docker-machine create the ec2 instance to host docker
docker-machine create --driver amazonec2 --amazonec2-open-port 80 --amazonec2-region $AWS_REGION $DM_NAME

# Let's grab the Host machine's Public and Private IP addresses
PRIVATE_IP=$(docker-machine inspect -f '{{ .Driver.PrivateIPAddress }}' $DM_NAME)
echo $PRIVATE_IP
PUBLIC_IP=$(docker-machine ip $DM_NAME)
echo $PUBLIC_IP

# Make the created docker-machine the active docker-machine for docker commands
# docker-machine env $DM_NAME
eval $(docker-machine env $DM_NAME)

# Pull and run GovReady-Q 0.9.0 container making site available on port 80 with no https
docker run --detach --name govready-q-0.9.0 -p $PRIVATE_IP:80:8000 \
-e HTTPS=false -e DBURL= -e DEBUG=true \
-e HOST=$PUBLIC_IP \
govready/govready-q-0.9.0

# Configure Superuser account for GovReady-Q
docker exec -it govready-q-0.9.0 first_run

# Provide some frienly feedback
echo "Point your browser to http://$PUBLIC_IP"

echo " "
echo "To stop container run: docker-machine stop $DM_NAME"
echo "To rm container and hosting ec2 instance run: docker-machine rm $DM_NAME"
