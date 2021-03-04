#!/usr/bin/env sh
[[ -z "${DEBUG}" ]] || set -x

case "$DRONE_DEPLOY_TO" in
 test) export APP_URL=https://designer.test.stp-forms-notprod.homeoffice.gov.uk ;;
    *) export APP_URL=https://designer.dev.stp-forms-notprod.homeoffice.gov.uk ;;
esac

echo ${APP_URL}
cd digital-form-builder/smoke-tests/designer/
sed -i 's|http://localhost:3000|${APP_URL}|g' wdio.headless.conf.js

head -5 wdio.headless.conf.js