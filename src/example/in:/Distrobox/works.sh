container=testXvfb

inDistrobox(){
  mkdir -p ~/distrobox/$container
  distrobox create --pull --image ubuntu --name $container --home ~/distrobox/$container
}

Server(){
  # https://jasonmurray.org/posts/2021/x11vnc/
  sudo apt-get install x11vnc xvfb fluxbox
  sudo x11vnc -create -env FD_PROG=/usr/bin/fluxbox -env X11VNC_CREATE_GEOM=${1:-1024x768x16} -nopw -listen 127.0.0.1 -forever
}

Client(){
  sudo apt install tigervnc-viewer
  vncviewer 127.0.0.1
}
