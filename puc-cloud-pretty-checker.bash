#!/usr/bin/env bash
node node_modules/eslint/bin/eslint.js -c ./.eslintrc.js --ext .ts --ext .js \
 --fix "$@"
exit $?