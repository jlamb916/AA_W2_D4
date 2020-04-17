require "byebug"

def palindrome?(word)
    
    len = word.length
    return true if len == 1

    i = 0
    while i < len / 2
        return false if word[i] != word[len - 1 - i]
        i += 1
    end

    true
end

def substrings(str)
    
    sub_str = []

    str.each_char.with_index do |char1, idx1|
        sub_str << char1
        str.each_char.with_index do |char2, idx2|
            sub_str << str[idx1..idx2] if idx1 < idx2
        end
    end
    
    return sub_str  
end

def palindrome_substrings(string)
 
    sub_strings = substrings(string)
    sub_strings.select {|sub| sub.length > 1 && palindrome?(sub) }

end