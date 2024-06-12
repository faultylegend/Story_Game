extends CharacterBody2D

@onready var player_anim := $PlayerAnim
@onready var weapon_anim := $WeaponAnim
var walk_speed := 100

func _ready():
	player_anim.play("idle")
	weapon_anim.play("idle")

func _physics_process(delta):
	var direction : Vector2 = Input.get_vector("left","right","up","down").normalized()
	if direction:
		velocity = direction * walk_speed
		player_anim.play("walk")
	else:
		velocity = Vector2.ZERO
		player_anim.play("idle")
		weapon_anim.play("idle")
	if Input.is_action_just_pressed("swing"):
		weapon_anim.play("swing")
	
	move_and_slide()
