class_name Inventory extends Node2D

var backpack: Dictionary

func add_item(item: StringName, quantity: int = 1) -> void:

	if backpack.has(item): backpack[item] += quantity
	else: backpack[item] = quantity

func remove_item(item: StringName, quantity: int = 1) -> void:

	if backpack.has(item):

		backpack[item] -= quantity
		if backpack[item] <= 0: backpack.erase(item)

func have_item(item: StringName, quantity: int = 1) -> bool:

	if backpack.has(item): if backpack[item] >= quantity: return true

	return false
