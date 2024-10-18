extends CharacterBody2D

var health = 2
@onready var healthbar = $ProgressBar

func hit(hit_dir):
	self.velocity = hit_dir * 100
	health -= 1
	healthbar.value = health
	if health == 0:
		queue_free()

func _process(delta):
	velocity *= .8
	move_and_slide()
	pass
