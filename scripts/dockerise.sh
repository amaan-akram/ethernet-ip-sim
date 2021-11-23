. ./scripts/env.sh

ARCHIVE=$1

docker build --tag $EXP/ethernet-ip-sim:$VER-$ARCH --build-arg BUILD_VER=$VER --build-arg BUILD_SHA=$SHA --file scripts/Dockerfile.ethernet-ip-sim .
if [ "$ARCHIVE" = true ]; then
  docker push $EXP/ethernet-ip-sim:$VER-$ARCH
fi
