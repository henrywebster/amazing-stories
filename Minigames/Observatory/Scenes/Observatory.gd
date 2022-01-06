extends Node2D

const CLOUD_SPAWN_MIN_X = 300.0
const CLOUD_SPAWN_MAX_X = 600.0
const CLOUD_SPAWN_MIN_Y = 0.0
const CLOUD_SPAWN_MAX_Y = 300.0

var cloud_scene = preload("res://Minigames/Observatory/Entities/Cloud.tscn")

func _ready():
	randomize()

func _on_CloudSpawnTimer_timeout():
	var cloud_instance = cloud_scene.instance()
	cloud_instance.position = Vector2(rand_range(CLOUD_SPAWN_MIN_X, CLOUD_SPAWN_MAX_X), rand_range(CLOUD_SPAWN_MIN_Y, CLOUD_SPAWN_MAX_Y))
	add_child(cloud_instance)
