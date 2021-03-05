#!/usr/bin/env sh
[[ -z "${DEBUG}" ]] || set -x

case "$DRONE_DEPLOY_TO" in
 test) export APP_URL=https://designer.test.stp-forms-notprod.homeoffice.gov.uk ;;
    *) export APP_URL=https://designer.dev.stp-forms-notprod.homeoffice.gov.uk ;;
esac

echo ${APP_URL}
sed -i "s|http://localhost:3000|${APP_URL}|g" wdio.smoketests.conf.js

mv wdio.smoketests.conf.js digital-form-builder/smoke-tests/designer/wdio.conf.js

echo "checking if selenium service is running"
curl http://selenium:4444/wd/hub/status