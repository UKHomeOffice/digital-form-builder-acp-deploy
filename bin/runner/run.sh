#!/usr/bin/env bash
[[ -z "${DEBUG}" ]] || set -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source /drone/src/bin/util.sh || exit 1
ls -lah /drone/src/bin/runner
source /drone/src/bin/runner/env.sh || exit 1

info "---"
info "Kube Environment: ${DRONE_DEPLOY_TO}"
info "Kube API URL: ${KUBE_SERVER}"
info "Kube Namespace: ${KUBE_NAMESPACE}"
info "App Release Version: ${APP_VERSION}"
info "PARENT JOB NUMBER: ${DRONE_BUILD_PARENT}"
info "XGOV TAG: ${XGOV_TAG}"
info "---"

case ${ACTION} in
  'deploy')
    info "Deploying the Digital Form Builder - Runner"
    kd --timeout 10m0s \
      -f kube/runner/service-app-tls.yaml \
      -f kube/runner/service-app.yaml \
      -f kube/runner/deployment-app.yaml \
      -f kube/runner/ingress-app-external.yaml \
      -f kube/runner/ingress-app-internal.yaml \
      -f kube/runner/networkpolicy-app.yaml ;;

  'destroy')
    warning "Destroying resources related to the ACP Example App (excluding secrets, ingress)"
    kd run delete service ${DEPLOYMENT_NAME} --ignore-not-found
    kd run delete deployment ${DEPLOYMENT_NAME} --ignore-not-found
    kd run delete networkpolicy ${DEPLOYMENT_NAME} --ignore-not-found ;;

  *)
    failed "Action '${ACTION}' is invalid, make sure 'ACTION' is set correctly ('deploy' or 'destroy')." ;;
esac