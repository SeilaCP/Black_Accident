extends CharacterBody3D

@export var player_path: NodePath
@onready var player = get_node(player_path)
@onready var nav_agent = $NavigationAgent3D

var speed = 3.0

func _ready():
	nav_agent.target_position = player.global_transform.origin

func _process(delta):
	nav_agent.target_position = player.global_transform.origin

func _physics_process(delta):
	if nav_agent.is_navigation_finished():
		return
	
	var direction = (nav_agent.get_next_path_position() - global_transform.origin).normalized()
	velocity = direction * speed
	move_and_slide()


