
def average(num_1, num_2)
    (num_1 + num_2) / 2.0
end

def average_array(array)
    (array.sum * 1.0) / array.length
end

def repeat(str, num)
    str * num  
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(str)
    split_str = str.split(" ")
    new_arr = []

    split_str.each_with_index do |word, i|
        if i.even?
            new_arr << word.upcase
        else
            new_arr << word.downcase
        end
    end

    new_arr.join(" ")
end