package main

import (
	"fmt"
	"os"

	steamworks "github.com/assemblaj/purego-steamworks"
)

const appID = 480 // add real appID

func main() {
	defer steamworks.Shutdown()

	if steamworks.RestartAppiIfNecessary(appID) {
		os.Exit(1)
	}
	if steamworks.Init() != nil {
		panic("steamworks.Init failed")
	}

	// alternatively you could run steamworks.RunCallbacks() every frame
	go steamworks.RunCallbacksForever()

	matchmaking := steamworks.SteamMatchmaking()
	steamworks.RegisterCallback(func(call steamworks.LobbyCreated) {
		fmt.Println("Created Lobby")
	})
	steamworks.RegisterCallback(func(call steamworks.LobbyEnter) {
		fmt.Println("Entered Lobby")
	})
	handle := matchmaking.CreateLobby(2, 2)
	fmt.Println("CREATING LOBBY WITH  API call ")
	fmt.Println(handle)
	steamworks.RegisterCallResult(handle, func(result steamworks.LobbyCreated, failed bool) {
		fmt.Println("lobby created")
		fmt.Println(result.SteamIDLobby)
	})
	for {

	}
}
