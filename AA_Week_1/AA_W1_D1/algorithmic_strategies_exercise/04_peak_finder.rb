# Write a method, peak_finder(arr), that accepts an array of numbers as an arg.
# The method should return an array containing all of "peaks" of the array.
# An element is considered a "peak" if it is greater than both it's left and right neighbor.
# The first or last element of the array is considered a "peak" if it is greater than it's one neighbor.
require "byebug"

def peak_finder(arr)
    new_arr = []
    #arr.each_with_index do |arr[ind], ind|
    (0...arr.length).each do |ind|
        
        if (ind == 0) && (arr[ind] > arr[ind + 1])
            new_arr << arr[ind]
        elsif (ind == arr.length - 1) 
            if  (arr[ind] > arr[ind - 1])
                new_arr << arr[ind]
            end 
        elsif (arr[ind] > arr[ind + 1]) && (arr[ind] > arr[ind - 1])
            new_arr << arr[ind]
        end
    end 
    new_arr
end


p peak_finder([1, 3, 5, 4])         # => [5]
p peak_finder([4, 2, 3, 6, 10])     # => [4, 10]
p peak_finder([4, 2, 11, 6, 10])    # => [4, 11, 10]
p peak_finder([1, 3])               # => [3]
p peak_finder([3, 1])               # => [3]
