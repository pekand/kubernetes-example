#!/bin/bash

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`
cd $SCRIPTPATH

"c:\Program Files\Git\usr\bin\openssl.exe" genrsa \
-out project.dev.key 2048

"c:\Program Files\Git\usr\bin\openssl.exe" req -new \
-key project.dev.key \
-out project.dev.csr \
-subj "/C=SK/ST=Slovakia/L=Bratislava/O=project/OU=project/CN=project.dev"

"c:\Program Files\Git\usr\bin\openssl.exe" x509 -req \
-in project.dev.csr \
-CA ../authority/ProjectCA.pem \
-CAkey ../authority/ProjectCA.key \
-CAcreateserial \
-out project.dev.crt \
-days 1825 \
-sha256 \
-extfile project.dev.ext \
-passin pass:password

