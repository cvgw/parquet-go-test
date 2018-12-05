FROM ubuntu:16.04 as builder
RUN apt-get update && apt-get install -y curl build-essential unzip git

RUN curl -O https://dl.google.com/go/go1.10.3.linux-amd64.tar.gz
RUN tar -xvf go1.10.3.linux-amd64.tar.gz -C /usr/local
ENV GOROOT /usr/local/go
ENV PATH /Users/cwippern/Code/zendesk/docker-images/dockmaster/bin:/Users/cwippern/Code/zendesk/docker-images/dockmaster/bin:/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin:/Users/cwippern/.goenv/shims:/usr/local/anaconda3/bin:/usr/local/opt/qt@5.5/bin:/usr/local/Cellar/python3/3.6.3/bin:/usr/local/opt/python/libexec/bin:/Users/cwippern/.avn/bin:/Users/cwippern/.nvm/versions/node/v6.1.0/bin:/Users/cwippern/Code/zendesk/dude_client_ruby/bin:/Users/cwippern/.rbenv/shims:/Users/cwippern/Code/zendesk/docker-images/dockmaster/bin:/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin:/Users/cwippern/.goenv/shims:/usr/local/anaconda3/bin:/usr/local/opt/qt@5.5/bin:/usr/local/Cellar/python3/3.6.3/bin:/usr/local/opt/python/libexec/bin:/Users/cwippern/.avn/bin:/Users/cwippern/Code/zendesk/dude_client_ruby/bin:/Users/cwippern/.rbenv/shims:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/Wireshark.app/Contents/MacOS:/usr/local/opt/go@1.7/libexec/bin:/usr/local/opt/go/libexec/bin:/Users/cwippern/Code/bin:/Users/cwippern/Code/utilities/classic_local_gems/bin:/Users/cwippern/Code/utilities/github-grep/bin:/usr/local/opt/go@1.7/libexec/bin:/usr/local/opt/go/libexec/bin:/Users/cwippern/Code/bin:/Users/cwippern/Code/utilities/classic_local_gems/bin:/Users/cwippern/Code/utilities/github-grep/bin:/usr/local/kubebuilder/bin:/usr/local/go/bin
RUN mkdir -p /golang/src
RUN mkdir -p /golang/bin
ENV GOPATH /golang
ENV GOBIN /Users/cwippern/Code/bin
ENV PATH /Users/cwippern/Code/zendesk/docker-images/dockmaster/bin:/Users/cwippern/Code/zendesk/docker-images/dockmaster/bin:/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin:/Users/cwippern/.goenv/shims:/usr/local/anaconda3/bin:/usr/local/opt/qt@5.5/bin:/usr/local/Cellar/python3/3.6.3/bin:/usr/local/opt/python/libexec/bin:/Users/cwippern/.avn/bin:/Users/cwippern/.nvm/versions/node/v6.1.0/bin:/Users/cwippern/Code/zendesk/dude_client_ruby/bin:/Users/cwippern/.rbenv/shims:/Users/cwippern/Code/zendesk/docker-images/dockmaster/bin:/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin:/Users/cwippern/.goenv/shims:/usr/local/anaconda3/bin:/usr/local/opt/qt@5.5/bin:/usr/local/Cellar/python3/3.6.3/bin:/usr/local/opt/python/libexec/bin:/Users/cwippern/.avn/bin:/Users/cwippern/Code/zendesk/dude_client_ruby/bin:/Users/cwippern/.rbenv/shims:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/Wireshark.app/Contents/MacOS:/usr/local/opt/go@1.7/libexec/bin:/usr/local/opt/go/libexec/bin:/Users/cwippern/Code/bin:/Users/cwippern/Code/utilities/classic_local_gems/bin:/Users/cwippern/Code/utilities/github-grep/bin:/usr/local/opt/go@1.7/libexec/bin:/usr/local/opt/go/libexec/bin:/Users/cwippern/Code/bin:/Users/cwippern/Code/utilities/classic_local_gems/bin:/Users/cwippern/Code/utilities/github-grep/bin:/usr/local/kubebuilder/bin:/Users/cwippern/Code/bin

RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
