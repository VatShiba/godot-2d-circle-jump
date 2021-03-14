extends Area2D

var velocity = Vector2(500, 0)
var jumpSpeed = 1000
var target = null

func _unhandled_input(event):
	if target and event is InputEventScreenTouch and event.pressed:
		jump()
		
func jump():
	target = null
	velocity = transform.x * jumpSpeed


func _on_Jumper_area_entered(area):
	target = area
	velocity = Vector2.ZERO

func _physics_process(delta):
	if target:
		transform = target.orbitPosition.global_transform
	else:
		position += velocity * delta
