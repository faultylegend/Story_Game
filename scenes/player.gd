extends CharacterBody2D

@onready var anim := $AnimationPlayer
var walk_speed := 100

func _ready():
	anim.play("idle")

func _physics_process(delta):
	var direction : Vector2 = Input.get_vector("left","right","up","down").normalized()
	if direction:
		velocity = direction * walk_speed
		anim.play("walk")
	else:
		velocity = Vector2.ZERO
		anim.play("idle")
	move_and_slide()
