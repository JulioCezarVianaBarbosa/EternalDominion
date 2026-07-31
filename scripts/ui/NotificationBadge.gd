extends Control

@export var count: int = 1

func _ready():

	var label = get_node("Center/Circle/Count") as Label

	if label == null:
		push_error("Label Count não encontrada.")
		return

	if count <= 0:
		visible = false
		return

	visible = true

	if count > 99:
		label.text = "99+"
	else:
		label.text = str(count)
