extends Control

@export var level: int = 29

@onready var level_label: Label = $Content/TextLayout/LevelLabel


func _ready() -> void:
	update_level()


func update_level() -> void:
	level_label.text = str(level)
