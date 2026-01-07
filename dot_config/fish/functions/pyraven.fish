function pyraven --description 'Run pyraven in Docker'
    docker run -it --rm \
        -v $HOME/.pyraven:/app/raven \
        -v $HOME:$HOME \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -w (pwd) \
        --dns-search secure.tethers.com \
        pyraven:latest $argv
end
