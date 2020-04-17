# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    
    def span
        return nil if self == []
        sorted = self.sort
        
        sorted[-1] - sorted[0]        
    end

    def average
        return nil if self == []
        acc = self.inject do |acc, ele|
            acc + ele
        end
        acc.to_f / self.length
    end

    def median
        return nil if self == []
        sorted = self.sort
        len = self.length
        if len.odd?
            return sorted[len / 2]
        else
            return (sorted[len / 2] + sorted[(len / 2) - 1]) / 2.0
        end
    end

    def counts
        new_hash = Hash.new(0)
        self.each do |el| 
            new_hash[el] += 1
        end
        return new_hash
    end

    def my_count(val)
        count = 0
        self.each{|el| count += 1 if el == val }
        count
    end

    def my_index(val)
        self.each_with_index{|el, i| return i if val == el} 
        return nil 
     end

     def my_uniq
        uniq = []
        self.select { |el| uniq << el if !uniq.include?(el)}
     end
     

     def my_transpose
        i = 0
        return_arr = []
        while i < self.length
            sub_arr = []
            j = 0
            while j < self.length
                sub_arr << self[j][i]
                j += 1
            end
            return_arr << sub_arr
            i += 1
        end
        return_arr
     end
end

