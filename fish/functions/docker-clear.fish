function docker-clear
	echo "Removing all docker images..."
    docker rmi (docker images --filter "dangling=true" -q --no-trunc)
end
