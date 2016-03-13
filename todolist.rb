
require 'date'

class TodoList
    attr_reader :title, :items ,:report_file
# Initialize todo list with a title and no items
    def initialize(list_title)
		@title = list_title
		@items = Array.new  # Starts empty! No Items yet!
		@report_file = File.new("report.txt", "w+")
	end

#Writing the output to a file 

# Creates a new Item and adds it to the array of Items
	def add_item(new_item)
	    item_add = Item.new(new_item)
	    @items.push(item_add)   #Adds new item to array
    end

#Prints the Title and calls method to print item details
    def print_list
    	@report_file .puts '*****************************'
    	@report_file.puts "Title - #{@title}"
    	@report_file .puts '*****************************'
	    @items.each_with_index do |value,index|
	        value.print_items(index+1,report_file)
	    end
	end    	

#Calls Item method to delete item with item id as input
    def remove_item(item_id)
        @report_file.puts '*****************************'
        @report_file.puts "Item: #{@items[item_id-1].description} is removed"   	
	    @items.delete_at(item_id-1)
    end

#Method to update title
    def update_title(new_title)
    	@title = new_title
    end
#Calls Item method to update completion status
    def update_status(item_pos,status)
    	@items[item_pos+1].update_completion_status(status)
    end

#Calls Item method and checks the completion status for each item
    def completed_status
    	@report_file.puts '*****************************'
        @items.each do |value|
     	   status = value.check_completed?
     	   if status == true
     	   	@report_file.puts "Item #{value.description} is completed"
     	   end
     	end
    	@report_file.puts '*****************************'
    end

#Calls Item method and checks for each item before updating the due date.
    def update_due_date(item_name,due_date)
    	@items.each do |value|
    	    if value.description == item_name # check each item against input item
    		    value.update_item_due_date(due_date)
    		    @report_file.puts "Item: #{item_name} due date updated to #{due_date}"
    	    end
        end
    end
end

#**********************************************************************

class Item
	attr_reader :description , :completed_status ,:due_date 

# Initialize item with a description and marked as not complete
	def initialize(input_description)
		@description = input_description
		@completed_status = false  #Initialize completed status to false
		date = DateTime.now + 10   
		@due_date = date.strftime("%m/%d/%Y") #Initialize due date current date + 10days
	end
#Method to print Item details
	def print_items(item_id,report_file)
    	report_file.puts "Item ID  : #{item_id}"
    	report_file.puts "Item     : #{@description}"
    	report_file.puts "Status   : #{@completed_status}"
    	report_file.puts "Due date : #{@due_date}"
    	report_file.puts '----------------------'
    end

#Method to update item completion status
    def update_completion_status(status)
    	@completed_status = status
    end

#Method to check Item is completed
    def check_completed?
    	@completed_status
    end

#Method to update Item due date
    def update_item_due_date(new_due_date)
    	@due_date = new_due_date
    end
end