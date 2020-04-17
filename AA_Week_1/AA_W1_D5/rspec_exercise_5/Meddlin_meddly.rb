# duos
# Write a method duos that accepts a string as an argument 
# and returns the count of the number of times the same character appears 
# consecutively in the given string.

def duos(str)
    count = 0

    str.each_char.with_index do |char, i|
        count += 1 if str[i] == str[i - 1] && i != 0
    end
    count
end

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

# sentence_swap
# Write a method sentence_swap that accepts a sentence and a hash as arguments. 
# The method should return a new sentence where every word is replaced with 
# it's corresponding value in the hash. If a word does not exist as a key of the hash, 
# then it should remain unchanged.

def sentence_swap(sentence, hash)

    words = sentence.split(" ")

    new_words = words.map do |word|
        if hash.has_key?(word)
            hash[word] 
        else
            word
        end
    end

    new_words.join(" ")
end


# Examples

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

# hash_mapped
# Write a method hash_mapped that accepts a hash, a proc, and a block.
# The method should return a new hash where each key is the result of the original 
# key when given to the block. Each value of the new hash should be the result 
# of the original values when passed into the proc.

def hash_mapped(hash, prc, &blk)
    new_hash = {}

    hash.each do |k, v|
        new_hash[blk.call(k)] = prc.call(v)
    end

    new_hash
end

# Examples

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

# counted_characters
# Write a method counted_characters that accepts a string as an argument. 
# The method should return an array containing the characters of the string 
# that appeared more than twice. The characters in the output array should appear
#  in the same order they occur in the input string.

def counted_characters(str)
    new_hash = Hash.new(0)
    new_arr = []

    str.each_char { |char| new_hash[char] += 1 }

    new_hash.each { |k, v| new_arr << k if v > 2 }

    new_arr
end


# Examples

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

# triplet_true?
# Write a method triplet_true? that accepts a string as an argument 
# and returns a boolean indicating whether or not the string contains 
# three of the same character consecutively.

def triplet_true(str)
    return false if str.length < 3
    i = 1
    while i < str.length - 1
        return true if str[i] == str[i - 1] && str[i] == str[i + 1]
        i += 1
    end
    false
end

# Examples

# p triplet_true('caaabb')        # true
# p triplet_true('terrrrrible')   # true
# p triplet_true('runninggg')     # true
# p triplet_true('bootcamp')      # false
# p triplet_true('e')             # false

# energetic_encoding
# Write a method energetic_encoding that accepts a string and a hash as arguments.
# The method should return a new string where characters of the original string 
# are replaced with the corresponding values in the hash. If a character is not 
# a key of the hash, then it should be replaced with a question mark ('?'). 
# Space characters (' ') should remain unchanged.

def energetic_encoding(str, hash)
    words = str.split(" ")

    words.each do |word|
        word.each_char.with_index do |char, i|
            if hash.has_key?(char)
                word[i] = hash[char]
            else
                word[i] = "?"
            end
        end
    end

    words.join(" ")
end

# # Examples

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

# uncompress
# Write a method uncompress that accepts a string as an argument.
# The string will be formatted so every letter is followed by a number.
# The method should return an "uncompressed" version of the string where every 
# letter is repeated multiple times given based on the number that appears 
# directly after the letter.

def uncompress(str)
    new_str = ""

    str.each_char.with_index do |char, i|
        if i % 2 == 0
            new_str += str[i] * (str[i + 1]).to_i
        end
    end
    new_str
end

# # Examples

# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

# conjunct_select
# Write a method conjunct_select that accepts an array and one or 
# more procs as arguments. The method should return a new array containing
# the elements that return true when passed into all of the given procs.

def conjunct_select(arr, *prc)

    arr.select { |ele| prc.all? { |p| p.call(ele) } }

end

# Examples

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

# convert_pig_latin
# Write a method convert_pig_latin that accepts a sentence as an argument. 
# The method should translate the sentence according to the following rules:

# words that are shorter than 3 characters are unchanged
# words that are 3 characters or longer are translated according to the following rules:
# if the word begins with a vowel, simply add 'yay' to the end of the word (example: 'eat'->'eatyay')
# if the word begins with a non-vowel, move all letters that come before the word's first vowel to the 
# end of the word and add 'ay' (example: 'trash'->'ashtray')
# Note that if words are capitalized in the original sentence, they should remain capitalized in the
# translated sentence. Vowels are the letters a, e, i, o, u.

def convert_pig_latin(sent)
    new_arr = []
    words = sent.split(" ")
    vowels = "aeiouAEIOU"

    words.each do |word|
        if word.length >= 3
            first = word[0]
            if vowels.include?(first)
                word.capitalize == word ? new_arr << (word + "yay").capitalize : new_arr << word + "yay"
            else
                i = firstVowelIndex(word)
                word.capitalize == word ? new_arr << (word[i..-1] + word[0...i] + "ay").capitalize : new_arr << word[i..-1] + word[0...i] + "ay"
            end
        else
            new_arr << word
        end
    end
    new_arr.join(" ")
end

def firstVowelIndex(word)

    vowels = "aeiouAEIOU"

    word.each_char.with_index do |char, i|
        if vowels.include?(char)
            return i
        end
    end

end


# Examples

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray


# reverberate
# Write a method reverberate that accepts a sentence as an argument. 
# The method should translate the sentence according to the following rules:

# words that are shorter than 3 characters are unchanged
# words that are 3 characters or longer are translated according to the following rules:
# if the word ends with a vowel, simply repeat the word twice (example: 'like'->'likelike')
# if the word ends with a non-vowel, repeat all letters that come after the word's last vowel,
#      including the last vowel itself (example: 'trash'->'trashash')
# Note that if words are capitalized in the original sentence, 
# they should remain capitalized in the translated sentence. 
# Vowels are the letters a, e, i, o, u.

def reverberate(sent)
    new_arr = []
    words = sent.split(" ")
    vowels = "aeiouAEIOU"

    words.each do |word|
        if word.length >= 3
            last = word[-1]
            if vowels.include?(last)
                word.capitalize == word ? new_arr << (word + word).capitalize : new_arr << word + word
            else
                i = lastVowelIndex(word)
                word.capitalize == word ? new_arr << (word + word[i..-1]).capitalize : new_arr << word + word[i..-1]
            end
        else
            new_arr << word
        end
    end
    new_arr.join(" ")
end

def lastVowelIndex(word)

    vowels = "aeiouAEIOU"

    i = word.length - 1

    while i >= 0
        if vowels.include?(word[i])
            return i
        end
        i -= 1
    end

end


# Examples

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"


# disjunct_select
# Write a method disjunct_select that accepts an array and one or more procs as arguments.
# The method should return a new array containing the elements that return true 
# when passed into at least one of the given procs.

def disjunct_select(arr, *prc)

    arr.select { |ele| prc.any? { |p| p.call(ele) } }
end

# Examples

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]

# alternating_vowel
# Write a method alternating_vowel that accepts a sentence as an argument. 
# The method should return a new sentence where the words alternate between 
# having their first or last vowel removed. For example:

# the 1st word should be missing its first vowel
# the 2nd word should be missing its last vowel
# the 3rd word should be missing its first vowel
# the 4th word should be missing its last vowel
# ... and so on
# Note that words that contain no vowels should remain unchanged. Vowels are the letters a, e, i, o, u.

def alternating_vowel(sent)
    words = sent.split(" ")
    new_arr = []
    vowels = "aeiou"

    words.each_with_index do |word, i|
        if check_vowels(word)
            if i % 2 == 0
                first = firstVowelIndex(word)
                new_arr << word[0...first] + word[first + 1..-1]
            else
                last = lastVowelIndex(word)
                new_arr << word[0...last] + word[last + 1..-1]
            end
        else
            new_arr << word
        end
    end

    new_arr.join(" ")
end

def check_vowels(word)
    vowels = "aeiou"
    word.each_char do |char|
        return true if vowels.include?(char)   
    end 
    false
end

# Examples

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

# silly_talk
# Write a method silly_talk that accepts a sentence as an argument. 
# The method should translate each word of the sentence according to the following rules:

# if the word ends with a vowel, simply repeat that vowel at 
# the end of the word (example: 'code'->'codee')

# if the word ends with a non-vowel, every vowel of the word should be
#  followed by 'b' and that same vowel (example: 'siren'->'sibireben')
# Note that if words are capitalized in the original sentence, 
# they should remain capitalized in the translated sentence. Vowels are the letters a, e, i, o, u.

def silly_talk(sent)
    words = sent.split(" ")
    vowels = "aeiouAEIOU"
    new_arr = []

    words.each do |word|
        if vowels.include?(word[-1])
            new_arr << (word.capitalize == word ? (word + word[-1]).capitalize : word + word[-1])
        else
            new_str = ""
            word.each_char.with_index do |char, i|
                if vowels.include?(char)
                    new_str += char + "b" + char
                else
                    new_str += char
                end
            end
            new_arr << (word.capitalize == word ? new_str.capitalize : new_str)
        end
    end

    new_arr.join(" ")
end

# Examples

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"


# compress
# Write a method compress that accepts a string as an argument. 
# The method should return a "compressed" version of the string where streaks 
# of consecutive letters are translated to a single appearance of the letter 
# followed by the number of times it appears in the streak. 
# If a letter does not form a streak (meaning that it appears alone), 
# then do not add a number after it.

def compress(str)

    new_str = ""
    i = 0
    while i < str.length 
        count = 0
        (i...str.length).each do |j|
            str[i] == str[j] ? count += 1 : break
        end
        if count > 1
            new_str += str[i] + count.to_s
        else
            new_str += str[i]
        end
        i += count
    end

    new_str
end

Examples

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"


# Given an array nums, write a function to move all 0's to the end of it 
# while maintaining the relative order of the non-zero elements.

def move_zeroes(nums)
    count = 0
    sorted = false
    while !sorted
        sorted = true
        i = 0
        while i < nums.length - 1 - count
            if nums[i] == 0
                nums[i], nums[i + 1] = nums[i + 1], nums[i]
                sorted = false
            end
            i += 1
        end

        count += 1
    end

    nums

end

# Example:

p move_zeroes([0,1,0,3,12])

# Input: [0,1,0,3,12]
# Output: [1,3,12,0,0]
# Note:

# You must do this in-place without making a copy of the array.
# Minimize the total number of operations.

# Given two arrays of integers nums and index. Your task is to create target array under the following rules:

# Initially target array is empty.
# From left to right read nums[i] and index[i], insert at index index[i] 
# the value nums[i] in target array.
# Repeat the previous step until there are no elements to read in nums and index.
# Return the target array.

# It is guaranteed that the insertion operations will be valid.

def create_target_array(nums, index_1)

    target_index = 
    
end

nums = [0,1,2,3,4], ind = [0,1,2,2,1]

 create_target_array(nums, ind)

 def create_target_array(nums, index)
    
    target = []
    
    nums.each do |i|
        target.insert(index[i], i)
    end
    
    target
    
end