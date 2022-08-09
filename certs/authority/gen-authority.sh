#!/bin/bash

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`
cd $SCRIPTPATH

"c:\Program Files\Git\usr\bin\openssl.exe" genrsa \
-des3 \
-passout pass:password \
-out ProjectCA.key 2048

"c:\Program Files\Git\usr\bin\openssl.exe" req \
-x509 \
-new \
-nodes \
-key ProjectCA.key \
-sha256 \
-days 1825 \
-out ProjectCA.pem \
-subj "/C=SK/ST=Slovakia/L=Bratislava/O=project/OU=project/CN=project.dev" \
-passin pass:password \
-passout pass:password

"c:\Program Files\Git\usr\bin\openssl.exe" x509 \
-outform der \
-in ProjectCA.pem \
-out ProjectCA.crt 

