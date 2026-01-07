function raven-toolkit --description 'Run raven-toolkit in Docker'
    docker run -it --init --rm \
        -e DISPLAY \
        -e SSH_AUTH_SOCK \
        -e USERNAME=$USER \
        -e LD_PRELOAD=/lib/x86_64-linux-gnu/libudev.so.1 \
        -u (id -u):(id -g) \
        -v $HOME:$HOME \
        -v (dirname $SSH_AUTH_SOCK):(dirname $SSH_AUTH_SOCK) \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -w (pwd) \
        --dns-search secure.tethers.com \
        docker.secure.tethers.com/raven/raven-toolkit:2022.2 $argv
end
