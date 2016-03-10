
class Todolist
	attr_reader :title, :items

	def initialize(list_title)
		@title = list_title
		@items = Array.new
	end
end

list = Todolist.new("Things to learn")

class Item
	attr_reader :description , :completed_status

	def initialize(input_description)
		@description = input_description
		@completed_status = false
	end
end

items = Item.new("To do laundry")

def add_item(new_item)
	item_add=Item.new(new_item)
	@items.push(item_add)
end