FROM runatlantis/atlantis:v0.4.13

RUN apk update && \
    apk add --no-cache musl-dev go govendor

ENV GOPATH=$HOME/go
ENV PATH=$PATH:$GOPATH/bin

RUN mkdir $HOME/go && \
    mkdir -p "$GOPATH/src/github.com/opencredo/" && \
    git clone https://github.com/opencredo/terrahelp.git "$GOPATH/src/github.com/opencredo/terrahelp" && \
    cd $GOPATH/src/github.com/opencredo/terrahelp && \
    govendor sync && \
    go install
