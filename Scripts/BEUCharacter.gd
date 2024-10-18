extends CharacterBody2D

@export var SPEED = 200
@onready var animtree = $AnimationTree

var facing = 1

func _ready():
	pass
	
func _process(delta):
	var dir = Input.get_vector("left","right","up","down")

	self.velocity = dir * SPEED

	
	if dir.x < 0 and facing == 1:
		self.scale.x *= -1
		facing = -1
	if dir.x > 0 and facing == -1:
		self.scale.x *= -1
		facing = 1
	
	if velocity.length() > .01:
		animtree['parameters/conditions/walk'] = true
		animtree['parameters/conditions/idle'] = false
	else:
		animtree['parameters/conditions/walk'] = false
		animtree['parameters/conditions/idle'] = true
		
	if Input.is_action_just_pressed("attack"):
		animtree['parameters/conditions/attack'] = true
		
	else:
		animtree['parameters/conditions/attack'] = false
		
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body != self:
		var knockback = Vector2(5, 0)
		body.hit(knockback)
	pass # Replace with function body.
