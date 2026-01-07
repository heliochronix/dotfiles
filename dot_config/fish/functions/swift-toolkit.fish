function swift-toolkit --description 'Run swift-toolkit in Docker'
    docker run -it --init --rm \
        -e DISPLAY \
        -e SSH_AUTH_SOCK \
        -e USERNAME=$USER \
        -u (id -u):(id -g) \
        -v $HOME:$HOME \
        -v (dirname $SSH_AUTH_SOCK):(dirname $SSH_AUTH_SOCK) \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -w (pwd) \
        --dns-search secure.tethers.com \
        docker.secure.tethers.com/swift/swift-toolkit $argv
end
