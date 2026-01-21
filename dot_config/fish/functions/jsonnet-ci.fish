function jsonnet-ci --description 'Run jsonnet-ci in Docker'
    docker run -it --user (id -u):(id -g) --rm -v (pwd):(pwd) --workdir (pwd) quay.io/coreos/jsonnet-ci "$argv"
end
