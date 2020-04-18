Phase 1: One true list
Our first iteration of this project will have the TodoBoard only manage a single List which contains many Items.

Item
Item::valid_date?(date_string)
This method should accept a string and return a boolean indicating if it is valid date of the form YYYY-MM-DD where Y, M, and D are numbers, such as 1912-06-23. The month should be a number from 1 to 12 and the day should be a number from 1 to 31. Here are examples of the expected behavior:

Item.valid_date?('2019-10-25') # true
Item.valid_date?('1912-06-23') # true
Item.valid_date?('2018-13-20') # false
Item.valid_date?('2018-12-32') # false
Item.valid_date?('10-25-2019') # false
For simplicity, we'll be using well-formed strings to represent our dates. However, if we were building this application for real users, then we would use a more robust solution like Ruby's Date objects. This would allow us to implement advanced features like time of day, timezone, and other niceties. We'll save that battle for another day.

Item#initialize(title, deadline, description)
This method should accept a title, deadline, and a description as arguments. These three pieces of data should be stored as instance variables of an Item. If the deadline is not a valid date, raise an error.

For example, here are examples of two items being created successfully and one invalid item:

Item.new('Fix login page', '2019-10-25', 'The page loads too slow.')

Item.new(
    'Buy Cheese',
    '2019-10-21',
    'We require American, Swiss, Feta, and Mozzarella cheese for the Happy hour!'
)

Item.new(
    'Fix checkout page',
    '10-25-2019',
    'The font is too small.'
) # raises error due to invalid date
Item#title
This method should return the item's title.

Item#title=(new_title)
This method should set the item's title.

Item#deadline
This method should return the item's deadline.

Item#deadline=(new_deadline)
This method should set the item's deadline. However, if the new deadline is not a valid date, then it should raise an error and not change the deadline.

Item#description
This method should return the item's description.

Item#description=(new_description)
This method should set the item's description.

------------------------------------------------------

List
An instance of List may contain many items. To do this, our List will have an underlying array. A list will also have a label.

List#initialize(label)
This method should accept a label as an argument and store the label of the list as an instance variable. Also initialize instance variable called items to an empty array. The array will eventually contain instances ofItem.

List#label
This method should return the list's label.

list#label=(new_label)
This method should set the list's label.

List#add_item(title, deadline, description)
This method should accept a title, deadline, and optional description as arguments. This method should create a new Item with the given information and add it to the end of the items array. When no description is passed in, the new item should have an empty description. If the given deadline is not valid, then no item should be added and the method should return false. If the item is successfully added, then the method should return true. Don't forget to require your 'item.rb' file into 'list.rb'.

List#size
This method should return the number of items currently in the list.

List#valid_index?(index)
This method should return a boolean indicating whether or not the given number is a valid position in the list. The first item of the list has index 0, the second item has index 1, and so on. A number is not a valid index if it is negative or too large given the current amount of items in the list.

Here's some food for thought. This method is similar to Item::valid_date?. However, why did we decide to make Item::valid_date? a class method but List#valid_index? an instance method? The reason is that #valid_index? requires knowledge about a specific List instance. That is, an index may be valid or invalid depending on the size of the list it is to be used on. On the flip side, valid_date? does not require any knowledge of a specific Item. That is, we do not need to know any information about any item to know if the date is formatted correctly. Ah, such practical design decisions!

List#swap(index_1, index_2)
This method should swap the position of the items at the given indices in the list. If either index is invalid, then don't swap any items and return false. If the indices are valid, then swap the items and return true.

Bracket method for list List#[](index)
This method should return the item of the list that is stored at the given index. If the index is invalid, then return nil. It is important that we define access to items of the list with a custom bracket method and not expose a reader or writer for the instance variable directly (@items). This is to prevent a user from manually manipulating the list in silly ways, like adding non Item instances to the list or having empty entries in the list. We encourage users to only manipulate the list according to the rules and methods that we have defined.

List#priority
This method should return the item at the the top of the list.

---------------------------------------------------

List#print
This method should print the label of the list and each item's title and deadline. For usability, also print the position of each item in the list. For example, here is a nice way to format the output:

------------------------------------------
                GROCERIES
------------------------------------------
Index | Item                 | Deadline
------------------------------------------
0     | cheese               | 2019-10-25
1     | toothpaste           | 2019-10-25
2     | shampoo              | 2019-10-24
3     | candy                | 2019-10-31
------------------------------------------
You don't need to spend too much time making the formatting pretty like we did above. However, if you are interested, we used String#ljust to pad strings with spaces to ensure that the columns have equal length. We also used string interpolation to avoid tedious concatenations.

List#print_full_item(index)
This method should print all information for the item at the given index, including the title, deadline, and description. The method should not print anything if the index not valid. Here is how we formatted our output for #print_full_item:

------------------------------------------
candy                           2019-10-31
4 bags should be enough
------------------------------------------
List#print_priority
The method should print all information for the item at the top of the list.

List#up(index, amount)
This method should move the item at the given index up the list by continually swapping it with the item directly above it the given amount of times. If the given index is not valid, then it should return false without modifying the list. If the index is valid, then it should return true. When the specified item needs to move up further, but is already at the top of the list, then it should remain at the top. If an amount is not passed in, then move the item up 1 position.

List#down(index, amount)
This method should move the item at the given index down the list by continually swapping it with the item directly below it the given amount of times. If the given index is not valid, then it should return false without modifying the list. If the index is valid, then it should should return true. When the specified item needs to move down further, but is already at the bottom of the list, then it should remain at the bottom. If an amount is not passed in, then move the item down 1 position.

Checkpoint - Up, down, all around
The last few methods required some complex logic. Let's verify their functionality in pry before we go any further down the rabbit hole. Create a list with some items and try moving them around with #up and #down, use #print frequently to check the outcome. Here is how we began to test our list:

[1] pry(main)> load 'list.rb'
=> true

[2] pry(main)> l = List.new('Groceries')
=> #<List:0x00007fac66bedf38 @items=[], @label="Groceries">

[3] pry(main)> l.add_item('cheese', '2019-10-25')
=> true

[4] pry(main)> l.add_item('toothpaste', '2019-10-25')
=> true

[5] pry(main)> l.add_item('shampoo', '2019-10-24')
=> true

[6] pry(main)> l.add_item('candy', '2019-10-31')
=> true

[7] pry(main)> l.print
------------------------------------------
                GROCERIES
------------------------------------------
Index | Item                 | Deadline
------------------------------------------
0     | cheese               | 2019-10-25
1     | toothpaste           | 2019-10-25
2     | shampoo              | 2019-10-24
3     | candy                | 2019-10-31
------------------------------------------
=> nil

[8] pry(main)> l.down(0)
=> true

[9] pry(main)> l.print
------------------------------------------
                GROCERIES
------------------------------------------
Index | Item                 | Deadline
------------------------------------------
0     | toothpaste           | 2019-10-25
1     | cheese               | 2019-10-25
2     | shampoo              | 2019-10-24
3     | candy                | 2019-10-31
------------------------------------------
=> nil

[10] pry(main)> l.down(0, 2)
=> true

[11] pry(main)> l.print
------------------------------------------
                GROCERIES
------------------------------------------
Index | Item                 | Deadline
------------------------------------------
0     | cheese               | 2019-10-25
1     | shampoo              | 2019-10-24
2     | toothpaste           | 2019-10-25
3     | candy                | 2019-10-31
------------------------------------------
=> nil

[12] pry(main)> l.up(3, 10)
=> true

[13] pry(main)> l.print
------------------------------------------
                GROCERIES
------------------------------------------
Index | Item                 | Deadline
------------------------------------------
0     | candy                | 2019-10-31
1     | cheese               | 2019-10-25
2     | shampoo              | 2019-10-24
3     | toothpaste           | 2019-10-25
------------------------------------------
=> nil

[14] pry(main)> l.up(7, 3) # invalid index 7
=> false
Our lists are looking pretty great! Only one more method to implement on this class.

List#sort_by_date!
This method should sort the items in the list according to their deadlines. The method should mutate the list's underlying array.

We can use Ruby's Array#sort_by! to perform this task. In general, the Array#sort_by! method is called on an array and will sort the array in place according to the criteria specified by the block. Here is an example:

dogs = [
    {name: 'Dezik', age: 5},
    {name: 'Tsygan', age: 6},
    {name: 'Lisa', age: 3}
]

dogs.sort_by! { |dog| dog[:age] }
p dogs #
# [ {:name=>"Lisa", :age=>3},
#   {:name=>"Dezik", :age=>5},
#   {:name=>"Tsygan", :age=>6} ]

dogs.sort_by! { |dog| dog[:name] }
p dogs #
# [ {:name=>"Dezik", :age=>5},
#   {:name=>"Lisa", :age=>3},
#   {:name=>"Tsygan", :age=>6} ]

It's worth mentioning that when the block for Array#sort_by! returns a number, the array will be sorted in increasing order according to those number values. When the block returns a string, the array will be sorted in "alphabetical" order according to those string values. If a string contains a numeric character, it can still be interpreted as having an "alphabetical" order. That is, the character '1' comes before the character '2', alphabetically.

Up until this point, we've been very strict in enforcing what strings are stored as deadlines in our items. Now we get reap the benefit! Here is how your method might behave:

[1] pry(main)> load 'list.rb'
=> true

[2] pry(main)> l = List.new('Groceries')
=> #<List:0x @items=[], @label="Groceries">

[3] pry(main)> l.add_item('cheese', '2019-10-25')
=> true

[4] pry(main)> l.add_item('toothpaste', '2019-10-25')
=> true

[5] pry(main)> l.add_item('shampoo', '2019-10-24')
=> true

[6] pry(main)> l.add_item('candy', '2019-10-31')
=> true

[7] pry(main)> l.print
------------------------------------------
                GROCERIES
------------------------------------------
Index | Item                 | Deadline
------------------------------------------
0     | cheese               | 2019-10-25
1     | toothpaste           | 2019-10-25
2     | shampoo              | 2019-10-24
3     | candy                | 2019-10-31
------------------------------------------
=> nil

[8] pry(main)> l.sort_by_date!
=> [#<Item:0x @deadline="2019-10-24", @description="", @title="shampoo">,
 #<Item:0x @deadline="2019-10-25", @description="", @title="cheese">,
 #<Item:0x @deadline="2019-10-25", @description="", @title="toothpaste">,
 #<Item:0x @deadline="2019-10-31", @description="", @title="candy">]

[9] pry(main)> l.print
------------------------------------------
                GROCERIES
------------------------------------------
Index | Item                 | Deadline
------------------------------------------
0     | shampoo              | 2019-10-24
1     | cheese               | 2019-10-25
2     | toothpaste           | 2019-10-25
3     | candy                | 2019-10-31
------------------------------------------
=> nil

TodoBoard
This is where things comes together. The TodoBoard class will be responsible for receiving user input and performing the correct action on the stored list. In this phase of the app, the board will only manage a single list. Because of this, you may find it trivial to implement these board methods since they simply delegate responsibility to the list methods. We design it in this way in order to have an extensible class that we can easily refactor for more features in phase two.

You should be using many List methods in the following steps. There is a method to the madness!

TodoBoard#initialize(label)
For now, a TodoBoard will only need create a single List with the given label and store it as an instance variable.

TodoBoard#get_command
This method should prompt the user to enter a command and perform the appropriate action on the list. The user may enter any of the following commands with arguments separated with spaces:

mktodo <title> <deadline> <optional description>
makes a todo with the given information
up <index> <optional amount>
raises the todo up the list
down <index> <optional amount>
lowers the todo down the list
swap <index_1> <index_2>
swaps the position of todos
sort
sorts the todos by date
priority
prints the todo at the top of the list
print <optional index>
prints all todos if no index is provided
prints full information of the specified todo if an index is provided
quit
returns false
For every command except quit, the method should return true after performing the command. We will leverage this boolean later to control if we should ask the user for another command or exit.

We recommend you use the splat operator * to easily handle the variable number of user arguments. We'll also require a lot of conditional logic to implement the command handling. For scenarios like this, using a case statement is much more preferable than a verbose chain of elsifs. For example, here is how we might write a partial #get_command that only supports mktodo and quit:

class TodoBoard
    # ...
    def get_command
        print "\nEnter a command: "
        cmd, *args = gets.chomp.split(' ')

        case cmd
        when 'mktodo'
            @list.add_item(*args)
        when 'quit'
            return false
        else
            print "Sorry, that command is not recognized."
        end

        true
    end
end
A small detail we can worry about later is that the user will enter their command with spaces separating their arguments. This will cause issues if they use any spaces within the text for the todo's title or description. We'll ignore this caveat for now.

TodoBoard#run
This method will contain our main loop that will keep prompting the user until #get_command returns false.

Use pry to test by calling #run on a board. Then, you can enter commands to test the app. Here is a list of commands that we entered to check out our board.

mktodo cheese 2019-10-25 foooooood
mktodo toothpaste 2019-10-23
mktodo candy 2019-10-31 sugar-free
mktodo shampoo 2019-10-25
print
sort
print
swap 0 3
print
print 1
priority
down 0
print
up 3 2
print

[1] pry(main)> load 'todo_board.rb'
=> true

[2] pry(main)> my_board = TodoBoard.new('groceries')
=> #<TodoBoard:0x @list=#<List:0x @items=[], @label="groceries">>

[3] pry(main)> my_board.run

Enter a command: mktodo cheese 2019-10-25 foooooood
Enter a command: mktodo toothpaste 2019-10-23
Enter a command: mktodo candy 2019-10-31 sugar-free
Enter a command: mktodo shampoo 2019-10-25
Enter a command: print
------------------------------------------
                GROCERIES
------------------------------------------
Index | Item                 | Deadline
------------------------------------------
0     | cheese               | 2019-10-25
1     | toothpaste           | 2019-10-23
2     | candy                | 2019-10-31
3     | shampoo              | 2019-10-25
------------------------------------------

Enter a command: sort

Enter a command: print
------------------------------------------
                GROCERIES
------------------------------------------
Index | Item                 | Deadline
------------------------------------------
0     | toothpaste           | 2019-10-23
1     | cheese               | 2019-10-25
2     | shampoo              | 2019-10-25
3     | candy                | 2019-10-31
------------------------------------------

Enter a command: swap 0 3

Enter a command: print
------------------------------------------
                GROCERIES
------------------------------------------
Index | Item                 | Deadline
------------------------------------------
0     | candy                | 2019-10-31
1     | cheese               | 2019-10-25
2     | shampoo              | 2019-10-25
3     | toothpaste           | 2019-10-23
------------------------------------------

Enter a command: print 1
------------------------------------------
cheese                          2019-10-25
foooooood
------------------------------------------

Enter a command: priority
------------------------------------------
candy                           2019-10-31
sugar-free
------------------------------------------

Enter a command: lower 0
Sorry, that command is not recognized.
Enter a command: down 0

Enter a command: print
------------------------------------------
                GROCERIES
------------------------------------------
Index | Item                 | Deadline
------------------------------------------
0     | cheese               | 2019-10-25
1     | candy                | 2019-10-31
2     | shampoo              | 2019-10-25
3     | toothpaste           | 2019-10-23
------------------------------------------

Enter a command: up 3 2

Enter a command: print
------------------------------------------
                GROCERIES
------------------------------------------
Index | Item                 | Deadline
------------------------------------------
0     | cheese               | 2019-10-25
1     | toothpaste           | 2019-10-23
2     | candy                | 2019-10-31
3     | shampoo              | 2019-10-25
------------------------------------------

Enter a command: printerino
Sorry, that command is not recognize

Phase 2: So little time, so much todo
In this phase of the project, we'll refactor our code to support the following features:

marking items as done
deleting items
managing multiple lists in a single board
Extending items and lists

Item#initialize(title, deadline, description)
Refactor this existing method to also initialize a boolean instance variable to track whether or not the item is "done". An item should be not "done" by default.

Item#toggle, List#toggle_item(index)
This new method should "flip" the current state the item. That is, if the item is done, then change it to not done; if it is not done, then change it to done.

Don't expose a writer method for the instance variable that tracks the done state. We want to properly encapsulate all of the data within an item. Imagine that the user is out to break your program! If they could write to the instance variable, they could assign it to some non-boolean value. Encapsulation means that the user can only manipulate the data in ways that the programmer intends.

We need to fully integrate this new feature into our app. Create a corresponding List#toggle_item(index) and modify TodoBoard#get_command to allow a user to utilize this new feature with the input command toggle <index>.

List#print, #print_full, #print_priority
Since our items contains a new field, update the output of these methods to also print out a column indicating whether or not the item is done.

List#remove_item(index)
This method should permanently delete the item of the list at the given index. If the index is invalid, the method should return false. If the deletion is successful, then the method should return true. Implement this method so that there are no awkward gaps in the list after an item is removed. Allow a user to utilize this new feature by supporting the input command rm <index>.

List#purge
This method should remove all items that are currently marked as done. Correctly implementing this may be tricky.

[1] pry(main)> import 'todo_board.rb'
[2] pry(main)> my_board = TodoBoard.new('cool-tech-to-learn')
=> #<TodoBoard:0x
 @list=
  #<List:0x
   @items=[],
   @label="cool-tech-to-learn">>
[3] pry(main)> my_board.run

Enter a command: mktodo ruby 2019-12-04
Enter a command: mktodo sql 2019-12-20
Enter a command: mktodo rails 2020-01-06
Enter a command: mktodo javascript 2020-01-08
Enter a command: mktodo react 2020-02-08
Enter a command: mktodo redux 2020-02-15
Enter a command: print
-------------------------------------------------
                COOL-TECH-TO-LEARN
-------------------------------------------------
Index | Item                 | Deadline   | Done
-------------------------------------------------
0     | ruby                 | 2019-12-04 | [ ]
1     | sql                  | 2019-12-20 | [ ]
2     | rails                | 2020-01-06 | [ ]
3     | javascript           | 2020-01-08 | [ ]
4     | react                | 2020-02-08 | [ ]
5     | redux                | 2020-02-15 | [ ]
-------------------------------------------------

Enter a command: toggle 0

Enter a command: print 0
-------------------------------------------------
ruby                            2019-12-04    [✓]

-------------------------------------------------

Enter a command: toggle 0

Enter a command: print
-------------------------------------------------
                COOL-TECH-TO-LEARN
-------------------------------------------------
Index | Item                 | Deadline   | Done
-------------------------------------------------
0     | ruby                 | 2019-12-04 | [ ]
1     | sql                  | 2019-12-20 | [ ]
2     | rails                | 2020-01-06 | [ ]
3     | javascript           | 2020-01-08 | [ ]
4     | react                | 2020-02-08 | [ ]
5     | redux                | 2020-02-15 | [ ]
-------------------------------------------------

Enter a command: toggle 0

Enter a command: toggle 2

Enter a command: toggle 3

Enter a command: print
-------------------------------------------------
                COOL-TECH-TO-LEARN
-------------------------------------------------
Index | Item                 | Deadline   | Done
-------------------------------------------------
0     | ruby                 | 2019-12-04 | [✓]
1     | sql                  | 2019-12-20 | [ ]
2     | rails                | 2020-01-06 | [✓]
3     | javascript           | 2020-01-08 | [✓]
4     | react                | 2020-02-08 | [ ]
5     | redux                | 2020-02-15 | [ ]
-------------------------------------------------

Enter a command: rm 4

Enter a command: print
-------------------------------------------------
                COOL-TECH-TO-LEARN
-------------------------------------------------
Index | Item                 | Deadline   | Done
-------------------------------------------------
0     | ruby                 | 2019-12-04 | [✓]
1     | sql                  | 2019-12-20 | [ ]
2     | rails                | 2020-01-06 | [✓]
3     | javascript           | 2020-01-08 | [✓]
4     | redux                | 2020-02-15 | [ ]
-------------------------------------------------

Enter a command: purge

Enter a command: print
-------------------------------------------------
                COOL-TECH-TO-LEARN
-------------------------------------------------
Index | Item                 | Deadline   | Done
-------------------------------------------------
0     | sql                  | 2019-12-20 | [ ]
1     | redux                | 2020-02-15 | [ ]
-------------------------------------------------