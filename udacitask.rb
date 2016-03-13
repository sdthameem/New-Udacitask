require_relative 'todolist.rb'

# Creates a new todo list
mylist = TodoList.new("Things to complete")

# Add four new items
mylist.add_item("Alarm ring")
mylist.add_item("Wake up")
mylist.add_item("Bath")
mylist.add_item("Ready to office")

# Print the list
mylist.print_list

# Delete the first item
mylist.remove_item(1)

# Print the list
mylist.print_list

# Delete the second item
mylist.remove_item(2)

# Print the list
mylist.print_list

# Update the completion status of the first item to complete
mylist.update_status(1,true)

# Print the list
mylist.print_list

# Update the title of the list
mylist.update_title("New Things to learn")

# Print the list
mylist.print_list

#New features
#Get items that are in completed status
mylist.completed_status

##Add due date , times for each item
mylist.update_due_date("Wake up","03/12/2016")

# Print the list
mylist.print_list


