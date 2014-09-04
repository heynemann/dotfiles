function glb-update
	mkdir -p ~/Desktop/glb07/2014; and mkdir -p /Volumes/_criacao; and mount -t smbfs "//corp.globoi.com;bernardo@fileserver.corp.globoi.com/_criacao" /Volumes/_criacao; rsync -rax --progress --exclude="*.key" --exclude="/.gvfs" /Volumes/_criacao/00_padroes/04_projetos/17_HOME_GCOM/2014/ux/ ~/Desktop/glb07/2014/ux
end
