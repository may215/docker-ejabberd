#!/bin/bash
set -e

# Updates the known modules as to be found in https://github.com/processone/ejabberd-contrib

source "${EJABBERD_HOME}/scripts/lib/base_config.sh"
source "${EJABBERD_HOME}/scripts/lib/config.sh"
source "${EJABBERD_HOME}/scripts/lib/base_functions.sh"
source "${EJABBERD_HOME}/scripts/lib/functions.sh"


run_modules_update_specs() {
    echo -n 'Updating module specs... '
    ${EJABBERDCTL} modules_update_specs
}

run_modules_install_contrib() {
    echo -n 'Installing modules from ejabberd-contrib... '
    echo -n 'Done mod_rest...'
    ${EJABBERDCTL} mod_rest
    echo -n 'Done mod_rest...'
    ${EJABBERDCTL} ejabberd_auth_http
    echo -n 'Done ejabberd_auth_http...'
}


is_true ${EJABBERD_SKIP_MODULES_UPDATE} \
    && exit 0

run_modules_update_specs

run_modules_install_contrib

exit 0
