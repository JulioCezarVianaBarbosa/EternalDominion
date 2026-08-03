extends Control

@export_group("Conteúdo")

@export var title: String = "Menu"
@export var icon: Texture2D
@export var badge_count: int = 0

@export_group("Estado")

@export var selected: bool = false


@onready var _title: Label = $Content/Layout/Title
@onready var _icon: TextureRect = $Content/Layout/Icon
@onready var _badge = $Content/Layout/Badge
@onready var _highlight: Control = $Highlight


func _ready() -> void:
	update_visual()


func update_visual() -> void:

	# Texto
	_title.text = title

	# Ícone
	_icon.texture = icon

	# Badge
	_badge.count = badge_count
	_badge.update_badge()

	# Destaque
	_highlight.visible = selected
