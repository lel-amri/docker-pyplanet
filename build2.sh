#!/bin/sh
SCRIPT_PATH="$(realpath "$(readlink -f "$0")")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
ARTIFACTS_ROOT="$(realpath "$SCRIPT_DIR/../../artifacts")"
ARTIFACTS_DIR="${ARTIFACTS_ROOT}/radicale"
PYTHON_VERSION="3.10"
RADICALE_VERSION="3.1.7"
PRIVATE_DOCKER_REGISTRY="docker-registry.superlel.me/radicale"
PUBLIC_DOCKER_REGISTRY="docker.io/7fvzv7wjf/radicale"
(
	buildctl-daemonless.sh build --frontend dockerfile.v0 --local context="$SCRIPT_DIR" --local dockerfile="$SCRIPT_DIR" --output "type=image,name=${PRIVATE_DOCKER_REGISTRY}:${RADICALE_VERSION},oci-mediatypes=true,push=true"
)
