# Warmup
require "byebug"
# Write a recursive method, range, that takes a start and an end and 
# returns an array of all numbers in that range, exclusive. 
# For example, range(1, 5) should return [1, 2, 3, 4]. If end < start, you can return an empty array.
# Write both a recursive and iterative version of sum of an array.

def range(start, last)
    return [] if last <= start
    range(start, last-1) << last-1
end

def sum(arr)
    arr.sum
end

def rec_sum(arr)
    return arr[-1] if arr.length == 1
    sum = 0
    sum += arr.pop + rec_sum(arr)
    sum
    # rec_sum(arr[0]..arr[-2])
end

# p range(1, 5)
# p range(2, 7)
# p range(3, 8)
# p rec_sum([1, 2, 3, 4, 5])
# p rec_sum([4, 7, 9, 4])

# Exponentiation
# Write two versions of exponent that use two different recursions:

# # recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)

def exp_1(b, n) 
    return 1 if n == 0
    b * exp_1(b, n-1)
end

# p exp_1(2, 3)
# p exp_1(4, 3)
# p exp_1(1, 20)

#     2       0   =  1
#     2       1   =  2 * 1 = 2
#     2       2   =  2 * 2 = 4
# b = 2   n = 3   =  2 * 4 = 8


# # recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]

def exp_2(b, n)
    # debugger
    return 1 if n == 0
    return b if n == 1
    if n.even?
        exp_2(b, (n / 2)) ** 2 
    else 
        b * (exp_2(b, (n - 1) / 2) ** 2) 
    end
end

#  p exp_2(2, 3
# p exp_2(4, 4)
#  p exp_2(1, 20)


# Deep dup
# The #dup method doesn't make a deep copy:

# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]

# robot_parts_copy = robot_parts.dup

# shouldn't modify robot_parts
# robot_parts_copy[1] << "LEDs"
# # but it does
# robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]
# When we dup an Array, it creates a new array to hold the elements, 
# but doesn't recursively dup any arrays contained therein. 
# So the dup method creates one new array, but just copies over references to the original interior arrays.

# Sometimes you want a shallow dup and sometimes you want a deep dup.
#  Ruby keeps things simple by giving you shallow dup, and letting you write deep dup yourself.

# Using recursion and the is_a? method, write an Array#deep_dup method 
# that will perform a "deep" duplication of the interior arrays.


def deep_dup(array)
    return [array[0]] if array.length == 1
    [array.shift] + deep_dup(array)
end
# 3      [3]
# 2 3    res << [2 , 3]
# 1 2 3  res = [1 2, 3]
# arr = [5]
# dup = deep_dup(arr)
# p arr.object_id
# p dup.object_id

# p deep_dup([1, [2], [3, [4]]])
# p deep_dup([5, 2, 4, 6, 8])
# p deep_dup([9])




# Note: For simplicity's sake, we are only going to ensure the deep duplication of arrays. 
# Don't worry about deep-duping (or regular-duping) other types of mutable objects
#  (like strings, hashes, instances of custom classes, etc.), 
# since this would require that we implement a deep dup method for each of those classes, as well.

# It's okay to iterate over array elements using the normal each for this one :-)

# You should be able to handle "mixed" arrays. For instance: [1, [2], [3, [4]]].


# 1 2 3 4 5 6 
# 1 1 2 3 5 8
# Fibonacci
# Write a recursive and an iterative Fibonacci method. 
# The method should take in an integer n and return the first n Fibonacci numbers in an array.
# fib = fib(n - 1)

# fib = [1, 1]
# fib(2) = [1, 1] 
# fib(3) = [1, 1, 2] 
# fib(4) = [1, 1, 2, 3] 
# fib = [1,1,2] fib[-1] + fib[-2]

def fib(n) #6
    return [] if n < 1
    return [1] if n == 1
    return [1, 1] if n == 2
    fib = fib(n - 1) 
    fib << fib[-1] + fib[-2]
end

# p fib(3)
# p fib(6)
# p fib(9)


# You shouldn't have to pass any arrays between methods; 
# you should be able to do this just passing a single 
    # argument for the number of Fibonacci numbers requested.


# Binary Search

# Write a recursive binary search: bsearch(array, target). 
# Note that binary search only works on sorted arrays.
#  Make sure to return the location of the found object 
#  (or nil if not found!). Hint: you will probably want to use subarrays.

# Make sure that these test cases are working:

def bsearch(array, target)
    return nil if array.length == 0
    # return 0 if array.length == 1 && array[0] == target 
    mid = array.length/2
    if array[mid] == target
        return mid
    end
    
    if array[mid] < target
        idx = bsearch(array[mid + 1..-1], target)
        idx.nil? ? nil : idx + mid + 1
    else
        bsearch(array[0...mid], target)
    end
end

# [5]  = 0
# [5 9] = 1
# [1, 3, 4, 5, 9] = 2 target = 5 
p bsearch([1, 3, 4, 5, 9], 5) # => 3

p bsearch([3], 3) #=> 0
p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6, 7], 5) # => 4
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

# Merge Sort
# Implement a method merge_sort that sorts an Array:

# The base cases are for arrays of length zero or one. 
# Do not use a length-two array as a base case. This is unnecessary.
# You'll want to write a merge helper method to merge the sorted halves.
