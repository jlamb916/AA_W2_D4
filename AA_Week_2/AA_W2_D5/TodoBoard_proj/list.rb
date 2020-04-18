require_relative "item.rb"
class List

    attr_reader :label
    attr_writer :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description=nil)
        new_item = Item.new(title, deadline, description)
        new_item.description ||= ""
        if !Item.valid_date?(deadline)
            return false
        else
            @items << new_item
            return true
        end
    end

    def size
        @items.length
    end

    def valid_index?(index)
        if (0...self.size).to_a.include?(index)
            return true
        else
            return false
        end
    end

    def swap(index_1, index_2)
        if self.valid_index?(index_1) && self.valid_index?(index_2)
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            return true
        else
            return false
        end
    end

    def [](index)
        if !self.valid_index?(index)
            return nil
        else
            return @items[index]
        end
    end

    def priority
        @items[0]
    end

    def print
        puts "------------------------------------------"
        puts  "          #{self.label.upcase}            "
        puts  "------------------------------------------"
        puts  "Index | Item                   |  Deadline | Toggle"
        puts  "------------------------------------------"
        @items.each_with_index do |item, idx|
            puts "#{idx} | #{item.title}       |  #{item.deadline}  | #{item.done}"
        end
    end

    def print_full_item(index)
        if [index]
            puts "------------------------------------------"
            puts "#{@items[index].title}             #{@items[index].deadline}"
            puts "#{@items[index].description}                   #{@items[index].done}"
        end
    end

    def print_priority
        self.print_full_item(0)
    end

    def up(index, amount=1)
        count = 0
        # final_index = index - amount
        # if final_index < 0
        #     final_index = 0
        # end
        while  count < amount
            # if final_index == index
            #     return true
            # end
            if swap(index, index - 1)
            index = index - 1
            count += 1
            elsif index == 0
                return true
            else
            return false
            end
        end
        return true
    end
    
    def down(index, amount=1)
        count = 0
        while  count < amount
            
            if swap(index, index + 1) 
            index = index + 1
            count += 1
            else
            return false
            end
        end
        return true
    end

    def sort_by_date!
        @items.sort_by! { |item| item.deadline}
    end
    
    def toggle_item(index)
        @items[index].toggle
    end

    def remove_item(index)
        if valid_index?(index)
            @items.delete_at(index)
            return true
        else
            return false
        end
    end

    def purge
        @items.each_with_index { |item, i| remove_item(i) if item.done == true}
    end

end

