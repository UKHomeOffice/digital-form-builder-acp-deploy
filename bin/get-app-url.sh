#!/usr/bin/env sh
[[ -z "${DEBUG}" ]] || set -x

if [ ${DRONE_DEPLOY_TO} == 'test' ]
then
   export APP_URL=https://designer.test.stp-forms-notprod.homeoffice.gov.uk
else
   export APP_URL=https://designer.dev.stp-forms-notprod.homeoffice.gov.uk
   
fi

cd digital-form-builder/smoke-tests/designer/
sed -i 's|http://localhost:3000|${APP_URL}|g' wdio.headless.conf.js

