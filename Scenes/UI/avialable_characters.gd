extends VBoxContainer




func _ready() -> void:
	for button in self.get_children():
		button.pressed.connect(_on_buttom_pressed.bind(button))

func _on_buttom_pressed(button):
	print("button:", button)
