extends Control

@export var icon: Texture2D
@export var value: String = "0"
@export var max_value: String = ""

@onready var icon_node = $Root/Content/Icon
@onready var value_node = $Root/Content/Value


func _ready():
	update_bar()


func update_bar():
	if icon:
		icon_node.texture = icon

	if max_value.is_empty():
		value_node.text = value
	else:
		value_node.text = value + "/" + max_value
