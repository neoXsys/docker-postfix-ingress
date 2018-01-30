if [ ! -e /var/run/docker_services ]; then
    echo "Starting services"
    service rsyslog  start
    service crond start
    service postfix restart
    touch /var/run/docker_services
fi
