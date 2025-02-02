extends CharacterBody2D

const SPEED : int = 10 ## The player's speed rating

var click_position : Vector2 ## Area where the mouse is clicked, for moving toward


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == 1:
		click_position = event.position
		print(click_position)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	move_and_slide()
