
def zip(*arr)
    arr.transpose
end

def prizz_proc(arr, prc1, prc2)

    arr.select{ |ele| [prc1, prc2].one? { |prc| prc.call(ele)} }
end

def zany_zip(*arr)
    max = arr[0]
    arr.each { |sub_arr| max = sub_arr if sub_arr.length > max.length}

    arr.each do |sub_arr|
        while sub_arr.length < max.length
            sub_arr << nil
        end
    end

    arr.transpose
end

def maximum(arr, &prc)
    return nil if arr.empty?

    new_arr = []
    arr.each do |ele|
        new_arr << prc.call(ele)
    end

    max = new_arr.max
    i = new_arr.length - 1
    while i > 0
        if new_arr[i] == max
            return arr[i]
        end
         i -= 1
    end


end

def my_group_by(arr, &prc)

    result = Hash.new() { |h, k| h[k] = [] }

    arr.each do |ele|
        result[prc.call(ele)] << ele
    end

    result
end

def max_tie_breaker(arr, prc, &blk)
    return nil if arr.empty?

    new_arr = []

    arr.each do |ele|
        new_arr << blk.call(ele)
    end

    max = new_arr.max

    count = new_arr.count(max)

    if count == 1
        return arr[new_arr.index(max)]
    end

    final = arr.select { |ele| blk.call(ele) == max }
   
    winner = final[0]
    final.each do |ele|
        winner = ele if prc.call(ele) > prc.call(winner)
    end

    return winner
end

def silly_syllables(sent)

    words = sent.split(" ")
    final = []

    words.each do |word|
        vowels_count = countVowels(word)
        if vowels_count >= 2
            start = firstVowelIndex(word)
            finish = lastVowelIndex(word)
            new_word = word[start..finish]
            final << new_word
        else
            final << word
        end
    end
    final.join(" ")
end

def countVowels(word)
    vowels = "aeiou"

    word.count(vowels)
end

def firstVowelIndex(word)
    vowels = "aeiou"

    word.each_char.with_index do |char, idx|
        if vowels.include?(char)
            return idx
        end
    end
end

def lastVowelIndex(word)
    vowels = "aeiou"
    i = word.length - 1
    while i >= 0
        if vowels.include?(word[i])
            return i
        end
        i -= 1
    end
end