extends KinematicBody2D

var  vel = Vector2(0,0)
var is_jump=false
var is_falling=false
const SPEED=200
const GRAVEDAD=45
const CAIDA=380
const JUMPFORCE=-1000
onready var personaje=$Sprite

func _physics_process(delta):
	#seccion de dezplazamiento 
	if Input.is_action_pressed("rigth"):
		vel.x=SPEED
		personaje.play("run")
		personaje.flip_h=false
	
	elif Input.is_action_pressed("left"):
		vel.x=-SPEED
		personaje.play("run")
		personaje.flip_h=true
	
	else:
		personaje.play("idle")
	
	#seccion de salto 
	if Input.is_action_just_pressed("jump")and is_on_floor():
		vel.y=JUMPFORCE
		is_jump=false
	if not is_on_floor():
		personaje.play("jump")
		is_jump=true
	
	vel.y=vel.y+GRAVEDAD
		
	if Input.is_action_pressed("Down"):
		personaje.play("duck")
		vel.x=0
		if Input.is_action_pressed("jump")and !is_jump:
			set_collision_mask_bit(1,false)
			vel.y=CAIDA
				
		
	else:
		set_collision_mask_bit(1,true)
			
	
		
	#seccion de movimiento
		
	vel=move_and_slide(vel,Vector2.UP)
	vel.x = lerp(vel.x,0,0.1)
	
	
