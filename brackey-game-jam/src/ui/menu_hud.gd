extends Control

var itch_page : String = "https://itch.io/jam/brackeys-16"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	pass # Replace with function body.


func _on_itch_pressed():
	OS.shell_open(itch_page)


func _on_exit_pressed():
	get_tree().quit()
