if [[ -d ~/Dropbox/dev/go ]]; then
  export GOPATH=~/Dropbox/dev/go
else
  export GOPATH=~/dev/go
fi
export PATH=$PATH:~/dev/go/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin
