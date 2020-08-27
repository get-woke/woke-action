#!/bin/bash

cd "${GITHUB_WORKSPACE}/${INPUT_WORKDIR}" || exit 1

TEMP_PATH="$(mktemp -d)"
PATH="${TEMP_PATH}:$PATH"

echo '::group:: Installing woke ... https://github.com/caitlinelfring/woke'
curl -sfL https://raw.githubusercontent.com/caitlinelfring/woke/main/install.sh | sh -s -- -b "${TEMP_PATH}" "${WOKE_VERSION}" 2>&1
echo '::endgroup::'

echo '::group:: Running woke ...'
woke \
  --output simple \
  --exit-1-on-failure="${INPUT_FAIL_ON_ERROR:-false}"
  ${INPUT_WOKE_FLAGS}
echo '::endgroup::'
