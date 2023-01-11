extends Node2D

@onready var wall = preload("res://scenes/wall.tscn")
@onready var viewport_width = get_viewport().size.x

var speed:float = 100.0
var walls = []

func _ready():
	add_wall(Vector2(0, -1000), Vector2.ONE * 5)
	add_wall(Vector2(720, -1000), Vector2(-1, 1) * 5)
	
	add_wall(Vector2(0, 0), Vector2.ONE * 5)
	add_wall(Vector2(720, 0), Vector2(-1, 1) * 5)
	
	add_wall(Vector2(0, 900), Vector2.ONE * 5)
	
func _process(delta):
	for i in walls:
		i.global_position.y += speed * delta
	
func add_wall(pos:Vector2, applied_scale:Vector2):
	var new_wall = instance_wall(pos, applied_scale)
	walls.push_back(new_wall)

func instance_wall(pos:Vector2, applied_scale:Vector2):
	var new_wall = wall.instantiate()
	self.add_child(new_wall)
	new_wall.scale = applied_scale
	new_wall.global_position = pos
	return new_wall
	
