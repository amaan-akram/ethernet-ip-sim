. ./scripts/env.sh

ARCHIVE=$1

docker build --tag $EXP/opener-sim:$VER-$ARCH --build-arg BUILD_VER=$VER --build-arg BUILD_SHA=$SHA --file scripts/Dockerfile.opener-sim .
if [ "$ARCHIVE" = true ]; then
  docker push $EXP/opener-sim:$VER-$ARCH
fi