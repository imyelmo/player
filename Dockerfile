FROM alpine:latest

RUN apk add --no-cache shadow bash bash-completion iputils net-tools iproute2 vlc

# Add user vlc for VideoLAN to work.
ENV HOME /home/vlcplayer
RUN useradd --create-home --home-dir $HOME vlcplayer \
    && chown -R vlcplayer:vlcplayer $HOME \
    && chown -R vlcplayer:vlcplayer /media \
    && usermod -a -G audio,video vlcplayer
    
WORKDIR $HOME
USER vlcplayer

COPY player.sh /tmp/

#ENTRYPOINT ["/tmp/player.sh"]
ENTRYPOINT ["/bin/bash"]
