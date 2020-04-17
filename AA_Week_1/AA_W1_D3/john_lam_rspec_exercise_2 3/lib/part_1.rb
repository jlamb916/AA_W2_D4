require "byebug"

def partition(arr, n)

    array = Array.new(2) { Array.new() }
    arr.each do |num|
        if num >= n
            array[1] << num
        else
            array[0] << num
        end
    end
    
    array
end


def merge(hash_1, hash_2)
    
    merge_hash = {}
    
    keys = (hash_1.keys + hash_2.keys).uniq

    keys.each do |key|
        if hash_1.has_key?(key) && hash_2.has_key?(key)
            merge_hash[key] = hash_2[key]    
        elsif hash_1.has_key?(key)
            merge_hash[key] = hash_1[key]
        else
            merge_hash[key] = hash_2[key]
        end
    end

    merge_hash

end

def replace_vowels(word)
    
    vowels = "aeiouAEIOU"

    word.each_char.with_index do |char, i|
        if vowels.include?(char)
            word[i] = "*"
        end
    end

    word 
end

def censor(sentence, array)

    split = sentence.split(" ")
    new_array = []
    split.each do |word|
        if array.include?(word.downcase)
           censored_word = replace_vowels(word)
           new_array << censored_word
        else
            new_array << word
        end
    end
    new_array.join(" ")
end


def power_of_two?(num)

    while num > 0
        return true if num == 1
        if num % 2 == 0 
            num /= 2
        else
            return false
        end 
    end
end
