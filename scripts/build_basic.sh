#!/bin/bash

SCRIPT_PATH=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
LIBRARY_PATH="$(dirname "$SCRIPT_PATH")"
EXAMPLE_BUILD_PATH="examples/basic/build"

cd "${LIBRARY_PATH}"
cd "${EXAMPLE_BUILD_PATH}"

cmake ..
./basic "$@"
