require_relative "room"

class Hotel

    attr_reader :rooms
  
    def initialize(name, hash)
        @name = name
        @rooms = {}

        hash.each do |name, cap|
            @rooms[name] = Room.new(cap)
        end
    end

    def name
        words = @name.split(" ")

        cap_name = words.map do |word|
            word.capitalize
        end

        cap_name.join(" ")
    end

    def room_exists?(room)
        if @rooms.has_key?(room)
            return true
        else
            return false
        end
    end

    def check_in(person, room)
        if room_exists?(room)
            if @rooms[room].add_occupant(person) 
                print 'check in successful'
            else
                print 'sorry, room is full'
            end
        else
            print 'sorry, room does not exist'
        end
    end

    def has_vacancy?
        @rooms.values.any? { |room| room.available_space > 0}
    end

    def list_rooms
        @rooms.each do |name, room|
            puts name + " " + room.available_space.to_s
        end
    end

end
