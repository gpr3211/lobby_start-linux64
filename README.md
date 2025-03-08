modified build 
```bash
./build_game.sh
```
- outputs
```
~/projects/Games/testbed-ebiten/lobby_start$ sudo ./build_game.sh 
[+] Building 2.7s (6/6) FINISHED                                                                                         docker:default
 => [internal] load build definition from com.valvesoftware.SteamRuntime.Sdk-amd64,i386-sniper-sysroot.Dockerfile                  0.2s
 => => transferring dockerfile: 989B                                                                                               0.0s
 => [internal] load .dockerignore                                                                                                  0.3s
 => => transferring context: 2B                                                                                                    0.0s
 => [internal] load build context                                                                                                  0.2s
 => => transferring context: 92B                                                                                                   0.0s
 => CACHED [1/2] ADD com.valvesoftware.SteamRuntime.Sdk-amd64,i386-sniper-sysroot.tar.gz /                                         0.0s
 => CACHED [2/2] RUN mkdir -p /etc/sudoers.d && echo "%sudo ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/flatdeb && chmod 0440 /  0.0s
 => exporting to image                                                                                                             0.2s
 => => exporting layers                                                                                                            0.0s
 => => writing image sha256:621786d769b4ef24d9a8e5fb4a8e2e20aeca71da6c4f94e0a16b90d3a6dba7e6                                       0.1s
 => => naming to docker.io/library/steamrt_sniper_amd64:latest                                                                     0.1s
go: downloading github.com/assemblaj/purego-steamworks v0.0.0-20250305120547-0521e4817c19
go: downloading github.com/ebitengine/purego v0.8.2
Build completed successfully: santase_linux_amd64
~/projects/Games/testbed-ebiten/lobby_start$ lazygit 
~/projects/Games/testbed-ebiten/lobby_start$ ./santase_linux_amd64 
[S_API] SteamAPI_Init(): Loaded '/home/pavlin/.steam/debian-installation/linux64/steamclient.so' OK.
Setting breakpad minidump AppID = 480
SteamInternal_SetMinidumpSteamID:  Caching Steam ID:  76561198027879678 [API loaded no]
CREATING LOBBY WITH  API call 
Callback Type: LobbyCreated, Callback ID: 513 API Handle: 13214716661523741993
lobby created
25559040
Created Lobby
Entered Lobby
```
