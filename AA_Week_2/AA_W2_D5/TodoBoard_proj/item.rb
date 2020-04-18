class Item
    attr_reader :title, :deadline, :description, :done
    attr_writer :title, :deadline, :description
    def initialize(title, deadline, description)
        @title = title
        if !Item.valid_date?(deadline)
            raise 'error, invalid date'
        end
        @deadline = deadline
        @description = description
        @done = false
    end

    def deadline=(date_string)
        if !Item.valid_date?(date_string)
            raise 'error, change date'
        end
        @deadline = date_string
    end

    def self.valid_date?(date_string)
        date_arr = date_string.split("-")
        if !date_arr[0].length == 4
           return false
        end
        if !(1..12).to_a.include?(date_arr[1].to_i)
            return false
        end
        if !(1..31).to_a.include?(date_arr[2].to_i)
            return false
        end
        true
    end

    def toggle
        if @done == false
            @done = true
        else 
            @done = false
        end
    end

    


end