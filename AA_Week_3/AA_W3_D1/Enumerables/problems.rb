class   Array

    def my_each(&prc)
        self.length.times do |i|
            prc.call(self[i])
        end
        self
    end


#My Each
# Extend the Array class to include a method named my_each that takes a block,
# calls the block on every element of the array, and returns the original array.
# Do not use Enumerable's each method. I want to be able to write:


puts "*****Problem 1 - My Each*****"
#  calls my_each twice on the array, printing all the numbers twice.
# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end
# # => 1
#     #  2
#     #  3
#     #  1
#     #  2
#     #  3

# p return_value  # => [1, 2, 3]

# My Select
# Now extend the Array class to include my_select that takes a block and returns
# a new array containing only elements that satisfy the block. Use your my_each
# method!

    def my_select(&prc)
        result = []
        self.my_each do |ele|
            result << ele if prc.call(ele)
        end
        result
    end


puts "*****Problem 2 - My Select*****"
# Example:
# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

# My Reject
# Write my_reject to take a block and return a new array excluding elements that
# satisfy the block.

def my_reject(&prc)
    result = []
    self.my_each do |ele|
        result << ele if !prc.call(ele)
    end
    result
end


puts "*****Problem 3 - My Reject*****"
# Example:
# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# My Any
# Write my_any? to return true if any elements of the array satisfy the block
# and my_all? to return true only if all elements satisfy the block.

def my_any?(&prc)
    self.my_each do |ele|
        return true if prc.call(ele)
    end
    false
end

def my_all?(&prc)
    self.my_each do |ele|
        return false if !prc.call(ele)
    end
    true
end

puts "*****Problem 4 - My Any*****"
# Example:
#  a = [1, 2, 3]
# # p a.my_any? { |num| num > 1 } # => true
# # p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# Array
# My Flatten
# my_flatten should return all elements of the array into a new, one-dimensional
# array. Hint: use recursion!

def my_flatten
    flattened = []
    self.my_each do |ele|
        if ele.is_a?(Array)
            flattened += ele.my_flatten
        else
            flattened << ele
        end
    end
    flattened
end


puts "*****Problem 5 - My Flatten*****"
# Example:
# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

# My Zip
# Write my_zip to take any number of arguments. It should return a new array
# containing self.length elements. Each element of the new array should be an
# array with a length of the input arguments + 1 and contain the merged elements
# at that index. If the size of any argument is less than self, nil is returned
# for that location.

    def my_zip(*arrays)
        length = self.length 
        new_array = []

        (0...length).each do |idx|
            sub_arr = []
            sub_arr << self[idx]

            arrays.each do |array|
                sub_arr << array[idx]
            end
            new_array << sub_arr
        end
        new_array
    end


puts "*****Problem 6 - My Zip*****"
# Example:
# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# My Rotate
# Write a method my_rotate that returns a new array containing all the elements
# of the original array in a rotated order. By default, the array should rotate
# by one element. If a negative value is given, the array is rotated in the
# opposite direction.

def my_rotate(num=1)
    new = self.dup

    i = 0
    while i < num
        shift = new.shift 
        new.push(shift)
        i += 1
    end

    while i > num 
        pop = new.pop
        new.unshift(pop)
        i -= 1
    end

    new
end

puts "*****Problem 7 - My Rotate*****"
# Example:
# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

# My Join
# my_join returns a single string containing all the elements of the array,
# separated by the given string separator. If no separator is given, an empty
# string is used.

def my_join(separator = "")
    new_str = ""
    self.length.times do |idx|
        new_str += self[idx]
        new_str += separator if idx != self.length - 1
    end
    new_str
end

puts "*****Problem 8 - My Join*****"
# Example:
 a = [ "a", "b", "c", "d" ]
p a.my_join         # => "abcd"
p a.my_join("$")    # => "a$b$c$d"

# My Reverse
# Write a method that returns a new array containing all the elements of the
# original array in reverse order.

def my_reverse
    result = []
    self.my_each do |ele|
        result.unshift(ele)
    end
    result
end

puts "*****Problem 9 - My Reverse*****"
# Example:
# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]

# Review
# Now that we're all warmed up, let's review the iteration exercises from the
# prepwork. Implement the following methods:

#factors(num)
#bubble_sort!(&prc)
#bubble_sort(&prc)
#substrings(string)
#subwords(word, dictionary)

# Although these exercises are from the prepwork and come with specs, use this
# opportunity to practice your own testing skills. Write out each method, think
# of a few different example cases, and test out your code in pry.

# If you are having a tough time thinking of example cases, check out the specs.
# You can use those examples to test your solutions. Don't forget to move your
# enumerables_array.rb into a lib directory!

end
#------------------------------------------------------------------------
# ### Factors
#
# Write a method `factors(num)` that returns an array containing all the
# factors of a given number.

def factors(num)
    factors = []
    (1..num).each do |factor|
        factors << factor if num % factor == 0
    end
    factors
end

# p factors(6) # 1, 2, 3, 6
# p factors(21)
# p factors(11)

# ### Bubble Sort
#
# http://en.wikipedia.org/wiki/bubble_sort
#
# Implement Bubble sort in a method, `Array#bubble_sort!`. Your method should
# modify the array so that it is in sorted order.
#
# > Bubble sort, sometimes incorrectly referred to as sinking sort, is a
# > simple sorting algorithm that works by repeatedly stepping through
# > the list to be sorted, comparing each pair of adjacent items and
# > swapping them if they are in the wrong order. The pass through the
# > list is repeated until no swaps are needed, which indicates that the
# > list is sorted. The algorithm gets its name from the way smaller
# > elements "bubble" to the top of the list. Because it only uses
# > comparisons to operate on elements, it is a comparison
# > sort. Although the algorithm is simple, most other algorithms are
# > more efficient for sorting large lists.
#
# Hint: Ruby has parallel assignment for easily swapping values:
# http://rubyquicktips.com/post/384502538/easily-swap-two-variables-values
#
# After writing `bubble_sort!`, write a `bubble_sort` that does the same
# but doesn't modify the original. Do this in two lines using `dup`.
#
# Finally, modify your `Array#bubble_sort!` method so that, instead of
# using `>` and `<` to compare elements, it takes a block to perform the
# comparison:
#
# ```ruby
# [1, 3, 5].bubble_sort! { |num1, num2| num1 <=> num2 } #sort ascending
# [1, 3, 5].bubble_sort! { |num1, num2| num2 <=> num1 } #sort descending
# ```
#
# #### `#<=>` (the **spaceship** method) compares objects. `x.<=>(y)` returns
# `-1` if `x` is less than `y`. If `x` and `y` are equal, it returns `0`. If
# greater, `1`. For future reference, you can define `<=>` on your own classes.
#
# http://stackoverflow.com/questions/827649/what-is-the-ruby-spaceship-operator

class Array
  def bubble_sort!(&prc)
    sorted = false
    while !sorted
        sorted = true
        (0...self.length - 1).each do |i|
            if prc.call(self[i], self[i + 1]) == 1
                self[i], self[i + 1] = self[i + 1], self[i]
                sorted = false
            end
        end
    end 
    self
  end

  def bubble_sort(&prc)
    copy = self.dup
    copy.bubble_sort!(&prc)
  end

end

# p [1 ,3 , 12, 7, 5, 2].bubble_sort! { |num1, num2| num1 <=> num2 } #sort ascending
# p [1 ,3 , 12, 7, 5, 2].bubble_sort! { |num1, num2| num2 <=> num1 } #sort descending

# p [1 ,3 , 12, 7, 5, 2].bubble_sort { |num1, num2| num1 <=> num2 } #sort ascending
# p [1 ,3 , 12, 7, 5, 2].bubble_sort { |num1, num2| num2 <=> num1 } #sort descending
# ### Substrings and Subwords
#
# Write a method, `substrings`, that will take a `String` and return an
# array containing each of its substrings. Don't repeat substrings.
# Example output: `substrings("cat") => ["c", "ca", "cat", "a", "at",
# "t"]`.
#
# Your `substrings` method returns many strings that are not true English
# words. Let's write a new method, `subwords`, which will call
# `substrings`, filtering it to return only valid words. To do this,
# `subwords` will accept both a string and a dictionary (an array of
# words).

def substrings(string)
    new_array = []

    (0...string.length).each do |start|
        (start...string.length).each do |end_idx|
            new_array << string[start..end_idx]
        end
    end
    new_array
end

# p substrings("monopoly")
# p substrings("phone")

def subwords(word, dictionary)
    subs = substrings(word)
    subs.select {|sub| dictionary.include?(sub)}
end

# dictionary = ['monopoly', 'phone', 'dog']
# p subwords('phone', dictionary)
# p subwords('car', dictionary)

# ### Doubler
# Write a `doubler` method that takes an array of integers and returns an
# array with the original elements multiplied by two.

def doubler(array)
end

# ### My Each
# Extend the Array class to include a method named `my_each` that takes a
# block, calls the block on every element of the array, and then returns
# the original array. Do not use Enumerable's `each` method. I want to be
# able to write:
#
# ```ruby
# # calls my_each twice on the array, printing all the numbers twice.
# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end
# # => 1
#      2
#      3
#      1
#      2
#      3
#
# p return_value # => [1, 2, 3]
# ```

class Array
  def my_each(&prc)
  end
end

# ### My Enumerable Methods
# * Implement new `Array` methods `my_map` and `my_select`. Do
#   it by monkey-patching the `Array` class. Don't use any of the
#   original versions when writing these. Use your `my_each` method to
#   define the others. Remember that `each`/`map`/`select` do not modify
#   the original array.
# * Implement a `my_inject` method. Your version shouldn't take an
#   optional starting argument; just use the first element. Ruby's
#   `inject` is fancy (you can write `[1, 2, 3].inject(:+)` to shorten
#   up `[1, 2, 3].inject { |sum, num| sum + num }`), but do the block
#   (and not the symbol) version. Again, use your `my_each` to define
#   `my_inject`. Again, do not modify the original array.

class Array
  def my_map(&prc)
  end

  def my_select(&prc)
  end

  def my_inject(&blk)
  end
end

# ### Concatenate
# Create a method that takes in an `Array` of `String`s and uses `inject`
# to return the concatenation of the strings.
#
# ```ruby
# concatenate(["Yay ", "for ", "strings!"])
# # => "Yay for strings!"
# ```

def concatenate(strings)
end
