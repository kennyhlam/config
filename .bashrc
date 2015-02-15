export PATH=$PATH:/usr/local/go/bin

if [ -z "$(ps aux | grep boot2docker | grep VirtualBox)" ]; then
  boot2docker start
fi
$(boot2docker shellinit)

docker_loader() {
  image=$1
  opts=$2
  container_id=( $(docker ps | grep $image) )
  if [ -z $container_id ]; then
    is_interactive=$(echo $opts | grep -q '\-it')
    if [ -z $is_interactive  ]; then
        opts="$opts -it"
    fi
    is_shared=$(echo $opts | grep -q '\-v')
    if [ -z $is_shared ]; then
        opts="$opts -v $(pwd):/kennylam"
    fi
    opts="${opts/ /}"
    docker run $opts $image /bin/bash -l
  else
    if [ -z $opts ]; then
        opts="-it"
    else
        opts="-it $opts"
    fi
    docker exec $opts $container_id /bin/bash -l
  fi
}

alias dockerit=docker_loader
alias ll='ls -alF'
