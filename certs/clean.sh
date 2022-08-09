#!/bin/bash

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`
cd $SCRIPTPATH


rm ./authority/ProjectCA.crt
rm ./authority/ProjectCA.key
rm ./authority/ProjectCA.pem
rm ./authority/ProjectCA.srl

rm ./web/project.dev.crt
rm ./web/project.dev.csr
rm ./web/project.dev.key
