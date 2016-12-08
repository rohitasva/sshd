#!/bin/bash

if [ -n $USER ]; then
  export USER="jenkins"
fi

for version in $(ls -d */)
do
  version=$(echo $version | awk -F "\/" '{print $1}')
  echo "Generating docker file for $version"
  
  cp Dockerfile.template temp
  echo "FROM ubuntu:${version}" | cat - temp > temp1 && mv temp1 temp
  sed  -e "s/%USER%/${USER}/g" ./temp >  ${version}/Dockerfile
  rm -f temp

  if [ -f authorized_keys ]; then
    cp authorized_keys $version/
  fi
done

