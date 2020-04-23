require "byebug"

class Array
  # Write an `Array#my_inject` method. If my_inject receives no argument, then
  # use the first element of the array as the default accumulator.
  # **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your 
  # implementation.**

  
  def my_inject(accumulator = nil, &prc)

    if accumulator.nil?
      accumulator = self[0] 
      (1...self.length).each do |i|
        accumulator = prc.call(accumulator, self[i])
      end
    else
      (0...self.length).each do |i|
        accumulator = prc.call(accumulator, self[i])
      end
    end
    accumulator
  end

end

# Define a method `primes(num)` that returns an array of the first "num" primes.
# You may wish to use an `is_prime?` helper method.

def is_prime?(num)
  return false if num == 1
  (2...num).none? { |factor| num % factor == 0}
end

def primes(num)
  return []if num == 0
  prime_arr = []
  i = 2
  while prime_arr.length < num
    if is_prime?(i)
      prime_arr << i
    end
    i += 1
  end
  prime_arr
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.
# 5 * 4 * 3 * 2 * 1

def factorials_rec(num)
  return [1] if num == 1
  return [1, 1] if num == 2

end

class Array
  # Write an `Array#dups` method that will return a hash containing the indices 
  # of all duplicate elements. The keys are the duplicate elements; the values 
  # are arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hash = Hash.new {|h, k| h[k] = []}
    self.each_with_index do |ele, i|
      hash[ele] << i
    end
    hash.select { |key, arr| arr.length > 1}

  end
end

class String
  # Write a `String#symmetric_substrings` method that returns an array of 
  # substrings that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
  end
end

class Array
  
 
  def merge_sort(&prc)
    return self if self.length < 2
    # debugger
    left = []
    right = []
    mid = self.length / 2
    left = self.take(mid)
    right = self.drop(mid)
    
    l = left.merge_sort
    r = right.merge_sort

    Array.merge(l,r, &prc)
  end

  private
  def self.merge(left, right, &prc)
    arr = []
    until left.empty? || right.empty?
        if left.first > right.first
         arr << right.shift
        else
          arr << left.shift
        end
    end
    arr + left + right
  end
end

p [3,2].merge_sort

p [5,3,7,1,2].merge_sort