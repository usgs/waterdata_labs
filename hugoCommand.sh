#!/bin/bash

set -eux -o pipefail

HUGO_COMMAND=$1
HUGO_BASEURL=$2
ARGS=${@:3}

export HUGO_BASEURL=${HUGO_BASEURL}
case ${HUGO_COMMAND} in
    build)
        cd /src/themes/wdfn_theme
        npm install
        npm run build
        cd /src
        hugo ${ARGS}
        ;;
    server)
        cd /src/themes/wdfn_theme
        npm install
        npm run build
        npm run watch & cd /src && hugo server --bind=0.0.0.0 ${ARGS}
        ;;
    *)
    exec "$@"
        ;;
esac
