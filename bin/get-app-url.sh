#!/usr/bin/env sh

case ${DRONE_DEPLOY_TO} in

'development')
    export APP_URL=https://designer.dev.stp-forms-notprod.homeoffice.gov.uk
        ;;
      
'test')
    export APP_URL=https://designer.test.stp-forms-notprod.homeoffice.gov.uk
        ;;
;;
esac
cd digital-form-builder/smoke-tests/designer/
sed -i 's|http://localhost:3000|${APP_URL}|g' wdio.headless.conf.js

