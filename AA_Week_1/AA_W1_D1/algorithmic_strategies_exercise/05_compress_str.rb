# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".
def compress_str(str)
    n = str.length
    str1 = ""
    i = 0
    while i < n
        streaks = 0
        (i...n).each do |j|
            if str[i]== str[j]
                streaks += 1 
            else 
                break 
            end 
        end 
        if streaks > 1
            str1 += streaks.to_s + str[i]
        else
            str1 += str[i]
        end
        i += streaks
    end 
    str1
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
