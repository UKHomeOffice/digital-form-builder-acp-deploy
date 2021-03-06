#!/usr/bin/env bash
export IMAGE_VERSION=${DESIGNER_TAG=${DRONE_TAG=latest}}
case ${DRONE_DEPLOY_TO} in

'prod')
    export KUBE_SERVER="https://kube-api-prod.prod.acp.homeoffice.gov.uk"
    export KUBE_TOKEN=${KUBE_TOKEN_ACP_PROD=notset}
    export INTERNAL_URL=".internal.stp-forms-prod.homeoffice.gov.uk"
    export EXTERNAL_URL=".stp-forms-prod.homeoffice.gov.uk"
    export SERVICE_REPLICAS=1
    export UPTIME='Mon-Sun 00:00-00:00 Europe/London'
    export KUBE_CERTIFICATE_AUTHORITY=https://raw.githubusercontent.com/UKHomeOffice/acp-ca/master/acp-prod.crt
   ;;

'development')

    export KUBE_SERVER="https://kube-api-notprod.notprod.acp.homeoffice.gov.uk"
    export KUBE_TOKEN=${KUBE_TOKEN_ACP_NOTPROD=notset}
    export UPTIME='Mon-Fri 08:00-22:00 Europe/London'
    export INTERNAL_URL=".dev.internal.stp-forms-notprod.homeoffice.gov.uk"
    export EXTERNAL_URL=".dev.stp-forms-notprod.homeoffice.gov.uk"
    export SERVICE_REPLICAS=1
    export KUBE_NAMESPACE="stp-forms-dev"
    export KUBE_CERTIFICATE_AUTHORITY=https://raw.githubusercontent.com/UKHomeOffice/acp-ca/master/acp-notprod.crt
    export PREVIEW_URL=https://runner-preview.dev.stp-forms-notprod.homeoffice.gov.uk
    export PUBLISH_URL=https://runner-preview.dev.internal.stp-forms-notprod.homeoffice.gov.uk
        ;;
      
'test')
    export KUBE_SERVER="https://kube-api-notprod.notprod.acp.homeoffice.gov.uk"
    export KUBE_TOKEN=${KUBE_TOKEN_ACP_NOTPROD=notset}
    export UPTIME='Mon-Fri 08:00-22:00 Europe/London'
    export INTERNAL_URL=".test.internal.stp-forms-notprod.homeoffice.gov.uk"
    export EXTERNAL_URL=".test.stp-forms-notprod.homeoffice.gov.uk"
    export SERVICE_REPLICAS=1
    export KUBE_NAMESPACE="stp-forms-test"
    export KUBE_CERTIFICATE_AUTHORITY=https://raw.githubusercontent.com/UKHomeOffice/acp-ca/master/acp-notprod.crt
    export PREVIEW_URL=https://runner-preview.test.stp-forms-notprod.homeoffice.gov.uk
    export PUBLISH_URL=https://runner-preview.test.internal.stp-forms-notprod.homeoffice.gov.uk
        ;;

'preprod')
    export KUBE_SERVER="https://kube-api-notprod.notprod.acp.homeoffice.gov.uk"
    export KUBE_TOKEN=${KUBE_TOKEN_ACP_NOTPROD=notset}
    export UPTIME='Mon-Fri 08:00-22:00 Europe/London'
    export INTERNAL_URL=".preprod.internal.stp-forms-notprod.homeoffice.gov.uk"
    export EXTERNAL_URL=".preprod.stp-forms-notprod.homeoffice.gov.uk"
    export SERVICE_REPLICAS=1
    export KUBE_NAMESPACE="stp-forms-preprod"
    export KUBE_CERTIFICATE_AUTHORITY=https://raw.githubusercontent.com/UKHomeOffice/acp-ca/master/acp-notprod.crt
    export PREVIEW_URL=https://runner-preview.preprod.stp-forms-notprod.homeoffice.gov.uk
    export PUBLISH_URL=https://runner-preview.preprod.internal.stp-forms-notprod.homeoffice.gov.uk
        ;;
    *)
    failed "Environment '${DRONE_DEPLOY_TO}' is invalid, make sure 'DRONE_DEPLOY_TO' is set correctly."
;;
esac
