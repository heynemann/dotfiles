function docker-stop
	echo "Stopping containers..."
    docker stop (docker ps -a -q)
    echo "Removing containers..."
    docker rm (docker ps -a -q)
end
