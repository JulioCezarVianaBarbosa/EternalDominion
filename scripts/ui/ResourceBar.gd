extends Control

@export var resource_name: String = "Energia"

@export var value: String = "120/120"

func _ready():
	$Root/Content/Value.text = value
