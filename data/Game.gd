extends Node

const Player = preload("res://data/player/Player.tscn")
const PORT = 9999
var enet_peer = ENetMultiplayerPeer.new()

@onready var menu: VBoxContainer = $VBoxContainer

func _ready():
#	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass
	
func _input(_event):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

func add_player(peer_id):
	var player = Player.instantiate()
	player.name = str(peer_id)
	get_child(0).add_child(player)


func _on_host_pressed():
	menu.hide()
	enet_peer.create_server(PORT)
	multiplayer.multiplayer_peer = enet_peer
	multiplayer.peer_connected.connect(add_player)
	add_player(multiplayer.get_unique_id())


func _on_join_pressed():
	menu.hide()
	enet_peer.create_client("localhost", PORT)
	multiplayer.multiplayer_peer = enet_peer
