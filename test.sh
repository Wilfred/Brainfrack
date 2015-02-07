#!/bin/bash

ROOT_DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)

virtualenv "$ROOT_DIR/test_env"
source "$ROOT_DIR/test_env/bin/activate"

pip install cram==0.6
