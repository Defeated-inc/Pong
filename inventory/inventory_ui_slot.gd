extends ColorRect

@onready var texture_rect:TextureRect = %TextureRect

func show_item(item:Item):
	texture_rect.texture = item.texture
