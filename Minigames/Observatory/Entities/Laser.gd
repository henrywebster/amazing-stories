extends Node2D

# rate of the laser
const SPEED = 200.0

func _physics_process(delta):
	# move the laser forward every frame
	self.position += Vector2(0.0, -SPEED * delta).rotated(rotation)
	
	# simple removing method
	if self.position.y < -500.0:
		print("laser removed")
		queue_free()


func _on_Collider_area_entered(area):
	queue_free()
