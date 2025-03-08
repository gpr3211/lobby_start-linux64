#!/bin/bash

name=Santase
STEAM_RUNTIME_VERSION=3.0.20250108.112707
GO_VERSION=go1.23.0  # Explicitly set Go version instead of using go env

mkdir -p .cache/${STEAM_RUNTIME_VERSION}

# Download binaries for amd64.
if [ ! -f .cache/${STEAM_RUNTIME_VERSION}/com.valvesoftware.SteamRuntime.Sdk-amd64,i386-sniper-sysroot.Dockerfile ]; then
    (cd .cache/${STEAM_RUNTIME_VERSION}; curl --location --remote-name https://repo.steampowered.com/steamrt-images-sniper/snapshots/${STEAM_RUNTIME_VERSION}/com.valvesoftware.SteamRuntime.Sdk-amd64,i386-sniper-sysroot.Dockerfile)
fi
if [ ! -f .cache/${STEAM_RUNTIME_VERSION}/com.valvesoftware.SteamRuntime.Sdk-amd64,i386-sniper-sysroot.tar.gz ]; then
    (cd .cache/${STEAM_RUNTIME_VERSION}; curl --location --remote-name https://repo.steampowered.com/steamrt-images-sniper/snapshots/${STEAM_RUNTIME_VERSION}/com.valvesoftware.SteamRuntime.Sdk-amd64,i386-sniper-sysroot.tar.gz)
fi
if [ ! -f .cache/${GO_VERSION}.linux-amd64.tar.gz ]; then
    (cd .cache; curl --location --remote-name https://golang.org/dl/${GO_VERSION}.linux-amd64.tar.gz)
fi

# Build for amd64
(cd .cache/${STEAM_RUNTIME_VERSION}; docker build -f com.valvesoftware.SteamRuntime.Sdk-amd64,i386-sniper-sysroot.Dockerfile -t steamrt_sniper_amd64:latest .)
docker run --rm --workdir=/work --volume $(pwd):/work steamrt_sniper_amd64:latest /bin/bash -c "
export PATH=\$PATH:/usr/local/go/bin
export CGO_CFLAGS=-std=gnu99
export CGO_ENABLED=1

rm -rf /usr/local/go && tar -C /usr/local -xzf .cache/${GO_VERSION}.linux-amd64.tar.gz

# Build with proper rpath settings
go build -ldflags \"-extldflags '-Wl,-rpath,\\\$ORIGIN'\" -o ${name}_linux_amd64

# Ensure the binary is executable
chmod +x ${name}_linux_amd64
"
