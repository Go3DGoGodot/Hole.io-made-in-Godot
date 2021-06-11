extends KinematicBody

export var speed = 5

var hole_maker = preload("res://Hole/HoleMaker.tscn").instance()
var init_hole_radius = hole_maker.radius

func _ready():
	yield(get_parent(),"ready")
	get_parent().add_child(hole_maker)
	
func _physics_process(delta):
	var velocity=Vector3.ZERO
	if Input.is_action_pressed("ui_up"):
		velocity+=global_transform.basis.z
	if Input.is_action_pressed("ui_down"):
		velocity-=global_transform.basis.z
	if Input.is_action_pressed("ui_left"):
		velocity+=global_transform.basis.x
	if Input.is_action_pressed("ui_right"):
		velocity-=global_transform.basis.x
	move_and_slide(velocity*speed)
	sync_hole_maker()
	
func sync_hole_maker():
	hole_maker.global_transform.origin=global_transform.origin
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		set_hole_size(4)
	
func set_hole_size(size:float):
	scale = Vector3.ONE*size
	hole_maker.radius = init_hole_radius * size
	


func _on_Area_body_entered(body):
	if body.is_class("RigidBody"):
		body.apply_central_impulse(Vector3.DOWN)












