extends Node2D

# constants, could be changed to configurable fields
const ROTATION_MAX = 0.524
const ROTATION_SPEED = 1.0

# member variables
var angular_velocity = 0.0
var laser_scene = preload("res://Minigames/Observatory/Entities/Laser.tscn")

func _input(event):
	
	# laser gun controls
	
	if event.is_action_pressed("ui_left"):
		# rotate left when left key pressed
		angular_velocity = -ROTATION_SPEED
	elif event.is_action_pressed("ui_right"):
		# rotate left when left key pressed
		angular_velocity = ROTATION_SPEED
	elif (event.is_action_released("ui_left") and !Input.is_action_pressed("ui_right")) or (event.is_action_released("ui_right") and !Input.is_action_pressed("ui_left")):
		# stop movement when either key is released
		angular_velocity = 0.0

	# laser shooting
	if event.is_action_pressed("ui_accept"):
		_fire()

func _process(delta):
	# stop the Laser Gun from rotating more than ROTATION_MAX
	var rotation = $LaserGun.rotation
	if Input.is_action_pressed("ui_left") and rotation < -ROTATION_MAX or Input.is_action_pressed("ui_right") and rotation > ROTATION_MAX:
		angular_velocity = 0.0

func _physics_process(delta):
	# rotate the Laser Gun by the angular velocity
	$LaserGun.rotation += angular_velocity * delta

func _fire():
	var laser_instance = laser_scene.instance()
	laser_instance.scale = Vector2(0.5, 0.5)
	laser_instance.rotation = $LaserGun.rotation
	laser_instance.position = $LaserGun.position + Vector2(0.0, -35.0).rotated($LaserGun.rotation)
	self.add_child(laser_instance)
	
