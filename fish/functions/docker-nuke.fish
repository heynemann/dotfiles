function docker-nuke
	echo "Removing all docker images..."
    docker rmi (docker images -q)
end
