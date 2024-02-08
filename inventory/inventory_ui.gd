extends Panel
class_name InventoryUI

@export var slot_scene:PackedScene
@onready var grid_container = %GridContainer

func show_items(inventory:Inventory):
	for child in grid_container.get_children():
		child.queue_free()
		
	for item in inventory.get_items():
		var slot = slot_scene.instantiate()
		grid_container.add_child(slot)
		slot.show_item(item)
