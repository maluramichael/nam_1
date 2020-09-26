extends Node2D

export var player_path: NodePath
onready var player: Player = get_node(player_path)
onready var platform_scene = preload("res://Platform.tscn")

const PLATFORM_WIDTH = 500
const PLATFORM_HEIGHT = 700
const PLATFORMS_TO_GENERATE = 5

var last_platform_x = 0
var last_platform_y = 0

func _process(_delta):
	if player.position.y < last_platform_y + PLATFORM_HEIGHT:
		for i in range(PLATFORMS_TO_GENERATE):
			last_platform_y -= PLATFORM_HEIGHT
			var instance = platform_scene.instance()
			last_platform_x = (randf() * 0.5) * PLATFORM_WIDTH * 4
			instance.translate(Vector2(last_platform_x, last_platform_y))
			add_child(instance)
