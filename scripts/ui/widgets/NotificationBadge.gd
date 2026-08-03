extends Control

@export var count: int = 0

@onready var label: Label = $Center/Circle/Count

func _ready():
	update_badge()

func update_badge():

	if count <= 0:
		visible = false
		return

	visible = true

	if count > 99:
		label.text = "99+"
	else:
		label.text = str(count)
