def hipsterfy(word)
    vowels = "aeiou"
    reverse_word = word.reverse
    reverse_word.each_char.with_index do |char, i|
        if vowels.include?(char)
            return (reverse_word[0...i] + reverse_word[i+1..-1]).reverse
        end
    end
    word
end

def vowel_counts(str)
    vowels = "aeiou"
    vowels_hash = Hash.new(0)

    str.each_char do |char|
        if vowels.include?(char.downcase)
            vowels_hash[char.downcase] += 1
        end
    end
    vowels_hash
end

def caesar_cipher(str, num)
    alphabet = ("a".."z").to_a.join("")
    new_str = ""

    str.each_char.with_index do |char|
        if alphabet.include?(char)
            new_str += alphabet[(alphabet.index(char) + num) % 26]
        else
            new_str += char
        end    
    end

    new_str
end