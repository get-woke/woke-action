#!/bin/bash

cd "${GITHUB_WORKSPACE}/${INPUT_WORKDIR}" || exit 1

TEMP_PATH="$(mktemp -d)"
PATH="${TEMP_PATH}:$PATH"

echo '::group:: Installing woke ... https://github.com/get-woke/woke'
curl -sfL https://raw.githubusercontent.com/get-woke/woke/main/install.sh | sh -s -- -b "${TEMP_PATH}" "${INPUT_WOKE_VERSION}" 2>&1
echo '::endgroup::'

echo '::group:: Running woke ...'
woke \
  --output github-actions \
  --exit-1-on-failure="${INPUT_FAIL_ON_ERROR:-false}"
  ${INPUT_WOKE_ARGS}
echo '::endgroup::'
