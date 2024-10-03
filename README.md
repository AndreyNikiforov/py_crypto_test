# py_crypto_test

Compile cryptography python module on arm32v7. 

problem: Local works, GH Actions hangs.

## Building locally

Note: I am building from inside .devcontainer with dind (this project).

(same instructions as in Dockerfile)
```shell
docker buildx create --use --driver=docker-container --name container --bootstrap
docker buildx build . --platform=linux/arm/v7 --builder=container --progress plain -o dist -f Dockerfile
```

Successful completion of the build is enough to prove it is working (no need to check output)

## Building in GH

Project is configured to build on push

Example [failure](https://github.com/AndreyNikiforov/py_crypto_test/actions/runs/11074541698)