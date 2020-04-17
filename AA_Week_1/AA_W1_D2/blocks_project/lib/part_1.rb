require "byebug"

def select_even_nums(arr)
    
    arr.select {|num| num.even? }
    
end

def reject_puppies(arr)
   # debugger
    arr.reject { |h, k| h["age"] <= 2}
end

def count_positive_subarrays(arr)

    arr.count {|sub| sub.sum > 0}
end

def aba_translate(word)
    new = ""
    word.each_char.with_index do |char, i|
        if "aeiou".include?(char)
            new += char + "b" + char
        else
            new += char
        end
    end
    new

end

def aba_array(arr)
    
    arr.map {|ele| aba_translate(ele)}
end