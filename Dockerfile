FROM ubuntu
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
&& apt-get install -y bash bash-completion inetutils-tools inetutils-traceroute iputils-ping iputils-tracepath iputils-arping net-tools iproute2 vlc

# Add user vlc for VideoLAN to work.
ENV HOME /home/vlcplayer
RUN useradd --create-home --home-dir $HOME vlcplayer \
    && chown -R vlcplayer:vlcplayer $HOME \
    && chown -R vlcplayer:vlcplayer /media \
    && usermod -a -G audio,video vlcplayer
    
USER vlcplayer

COPY player.sh /tmp/

#ENTRYPOINT ["/tmp/player.sh"]
ENTRYPOINT ["/bin/bash"]
