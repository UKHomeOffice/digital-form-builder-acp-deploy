#!/usr/bin/env bash
[[ -z "${DEBUG}" ]] || set -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source /drone/src/bin/util.sh || exit 1
source /drone/src/bin/designer/env.sh || exit 1

info "---"
info "Kube Environment: ${DRONE_DEPLOY_TO}"
info "Kube API URL: ${KUBE_SERVER}"
info "Kube Namespace: ${KUBE_NAMESPACE}"
info "App Release Version: ${APP_VERSION}"
info "PARENT JOB NUMBER: ${DRONE_BUILD_PARENT}"
info "XGOV TAG: ${XGOV_TAG}"
info "---"

export NAME="forms-designer"
export PORT=3000

case ${ACTION} in
  'deploy')
    info "Deploying the Digital Form Builder - Designer"
    kd --timeout 10m0s \
      -f kube/designer/service-app-tls.yaml \
      -f kube/designer/service-app.yaml \
      -f kube/designer/deployment-app.yaml \
      -f kube/designer/ingress-app-external.yaml \
      -f kube/designer/ingress-app-internal.yaml \
      -f kube/designer/networkpolicy-app-external.yaml |
      -f kube/designer/networkpolicy-app-internal.yaml ;;

  'destroy')
    warning "Destroying resources related to the Digital Form Builder- Designer (excluding secrets, ingress)"
    kd run delete service ${DEPLOYMENT_NAME} --ignore-not-found
    kd run delete deployment ${DEPLOYMENT_NAME} --ignore-not-found
    kd run delete networkpolicy ${DEPLOYMENT_NAME} --ignore-not-found ;;

  *)
    failed "Action '${ACTION}' is invalid, make sure 'ACTION' is set correctly ('deploy' or 'destroy')." ;;
esac