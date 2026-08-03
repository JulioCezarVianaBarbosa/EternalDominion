extends MarginContainer

const MenuItemScene = preload("res://scenes/ui/widgets/MenuItem.tscn")

@onready var container: VBoxContainer = $VBoxContainer


func _ready() -> void:
	create_menu()


func create_menu() -> void:

	# Remove itens antigos
	for child in container.get_children():
		child.queue_free()

	# Cria os itens do menu
	for data in LeftMenuData.MENU:

		var item: MenuItem = MenuItemScene.instantiate()

		item.setup(data)

		# Seleciona o primeiro item (Home)
		if data["id"] == "home":
			item.selected = true
			item.update_visual()

		# Conecta o clique
		item.pressed.connect(_on_menu_item_pressed)

		container.add_child(item)


func _on_menu_item_pressed(item: MenuItem) -> void:

	# Remove seleção de todos
	for child in container.get_children():

		if child is MenuItem:
			child.selected = false
			child.update_visual()

	# Seleciona o item clicado
	item.selected = true
	item.update_visual()

	print("Menu selecionado:", item.id)
