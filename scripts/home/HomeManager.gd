extends Control

const PAGES = {

	"home": preload("res://scenes/home/pages/HomePage.tscn"),
	"news": preload("res://scenes/home/pages/NewsPage.tscn"),
	"missions": preload("res://scenes/home/pages/MissionsPage.tscn"),
	"events": preload("res://scenes/home/pages/EventsPage.tscn"),
	"gifts": preload("res://scenes/home/pages/GiftsPage.tscn"),
	"ranking": preload("res://scenes/home/pages/RankingPage.tscn"),
	"exchange": preload("res://scenes/home/pages/ExchangePage.tscn")

}

@onready var page_container = $HUD/CharacterArea

var current_page: Control


func _ready():

	open_page("home")


func open_page(page_id: String):

	if current_page:

		current_page.queue_free()

	if !PAGES.has(page_id):

		push_error("Página não encontrada: " + page_id)
		return

	current_page = PAGES[page_id].instantiate()

	page_container.add_child(current_page)
