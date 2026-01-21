function esphome --description 'Run ESPHome in Docker'
    docker run -it --network host --rm -v (pwd):/config ghcr.io/esphome/esphome:latest "$argv"
end
