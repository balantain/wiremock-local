#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."
WIREMOCK_VERSION="$(grep '^version=' $DIR/wiremock.version | cut -d'=' -f2)"

docker run -it --rm \
  -v "$DIR/src/test/resources/__files:/home/wiremock/__files" \
  -v "$DIR/src/test/resources/mappings:/home/wiremock/mappings" \
  -p 8080:8080 \
  --name wiremock \
  wiremock/wiremock:$WIREMOCK_VERSION \
  --verbose \
  --no-request-journal \
  --async-response-threads=100 \
  --container-threads=100 \
  --async-response-enabled=true \
  --local-response-templating




