class_name Inventory

var _content:Array[Item] = []

func set_items(items:Array[Item]):
	_content = items
	
func add_item(item:Item):
	_content.append(item)
	
func remove_item(item:Item):
	_content.erase(item)
	
func get_items() -> Array[Item]:
	return _content
