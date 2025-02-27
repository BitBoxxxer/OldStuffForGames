extends CharacterBody2D

@onready var animation_sprite := $AnimationSprite
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _play_animation(animation: String):
	if animated_sprite.animation != animation:
		animated_sprite.play(animation)
