#!/usr/bin/env sh
[[ -z "${DEBUG}" ]] || set -x

case "$DRONE_DEPLOY_TO" in
 test)  export APP_URL=https://designer.test.stp-forms-notprod.homeoffice.gov.uk
        export RUNNER_URL=https://runner-preview.test.stp-forms-notprod.homeoffice.gov.uk;;
    *)  export APP_URL=https://designer.dev.stp-forms-notprod.homeoffice.gov.uk
        export RUNNER_URL=https://runner-preview.dev.stp-forms-notprod.homeoffice.gov.uk;;
esac

echo ${APP_URL}
sed -i "s|http://localhost:3000|${APP_URL}|g" wdio.smoketests.conf.js
sed -i "s|http://localhost:3009|${RUNNER_URL}|g" wdio.smoketests.conf.js

mv wdio.smoketests.conf.js digital-form-builder/smoke-tests/designer/wdio.conf.js
echo " Checking external access -----------"
echo "Checking designer.dev.stp-forms-notprod.homeoffice.gov.uk"
curl -ivs designer.dev.stp-forms-notprod.homeoffice.gov.uk
if [ $? -ne 0 ]
then echo "Designer is UP"
else
echo "Designer  is down"
fi
echo "Checking runner-preview.dev.stp-forms-notprod.homeoffice.gov.uk"
curl -ivs runner-preview.dev.stp-forms-notprod.homeoffice.gov.uk
if [ $? -ne 0 ]
then echo "Runner is UP"
else
echo "Runner is down"
fi

cho "Checking designer.test.stp-forms-notprod.homeoffice.gov.uk"
curl -ivs designer.test.stp-forms-notprod.homeoffice.gov.uk
if [ $? -ne 0 ]
then echo "Designer is UP"
else
echo "Designer  is down"
fi
echo "Checking runner-preview.test.stp-forms-notprod.homeoffice.gov.uk"
curl -ivs runner-preview.test.stp-forms-notprod.homeoffice.gov.uk
if [ $? -ne 0 ]
then echo "Runner is UP"
else
echo "Runner is down"
fi

echo " Checking internal access -----------"
echo "Checking designer.dev.stp-forms-notprod.homeoffice.gov.uk"
curl -ivs designer.dev.stp-forms-notprod.homeoffice.gov.uk
if [ $? -ne 0 ]
then echo "Designer is UP"
else
echo "Designer  is down"
fi
echo "Checking runner-preview.dev.internal.stp-forms-notprod.homeoffice.gov.uk"
curl -ivs runner-preview.dev.internal.stp-forms-notprod.homeoffice.gov.uk
if [ $? -ne 0 ]
then echo "Runner is UP"
else
echo "Runner is down"
fi

cho "Checking designer.test.stp-forms-notprod.homeoffice.gov.uk"
curl -ivs designer.test.internal.stp-forms-notprod.homeoffice.gov.uk
if [ $? -ne 0 ]
then echo "Designer is UP"
else
echo "Designer  is down"
fi
echo "Checking runner-preview.test.stp-forms-notprod.homeoffice.gov.uk"
curl -ivs runner-preview.test.internal.stp-forms-notprod.homeoffice.gov.uk
if [ $? -ne 0 ]
then echo "Runner is UP"
else
echo "Runner is down"
fi
