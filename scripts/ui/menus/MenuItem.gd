extends Control
class_name MenuItem

signal pressed(item)

@export_group("Conteúdo")

@export var id: String = ""
@export var title: String = "Menu"
@export var icon: Texture2D
@export var badge_count: int = 0

@export_group("Estado")

@export var selected: bool = false

@onready var _title: Label = $Content/Layout/Title
@onready var _icon: TextureRect = $Content/Layout/Icon
@onready var _badge = $Content/Layout/Badge
@onready var _highlight: Control = $Highlight


func _ready():
	update_visual()


func setup(data: Dictionary) -> void:

	id = data.get("id", "")
	title = data.get("title", "Menu")
	badge_count = data.get("badge", 0)

	# Os ícones serão implementados no sistema IconLibrary
	# icon = ...

	update_visual()


func update_visual() -> void:

	# Texto
	if _title:
		_title.text = title

	# Ícone
	if _icon:
		_icon.texture = icon

	# Badge
	if _badge:
		_badge.count = badge_count
		_badge.visible = badge_count > 0

		if _badge.has_method("update_badge"):
			_badge.update_badge()

	# Destaque
	if _highlight:
		_highlight.visible = selected


func _gui_input(event):

	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.pressed:

		pressed.emit(self)
