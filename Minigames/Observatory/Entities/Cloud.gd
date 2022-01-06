extends Node2D


func _on_Collider_area_entered(area):
	queue_free()
