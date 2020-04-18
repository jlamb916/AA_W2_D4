require_relative "item.rb"
require_relative "list.rb"

class TodoBoard

    def initialize(label)
        @list = List.new(label)
    end
   
    def get_command
        print "\nEnter a command: "
        cmd, *args = gets.chomp.split(' ')
        
        case cmd
        when 'mktodo'
            @list.add_item(*args)
        when 'up'
            args.map! {|arg| arg.to_i}
            @list.up(*args)
        when 'down'
            args.map! {|arg| arg.to_i}
            @list.down(*args)
        when 'swap'
            @list.swap(*args)
        when 'sort'
            @list.sort_by_date!(*args)
        when 'priority'
            @list.print_priority(*args)
        when 'print'
            args.map! {|arg| arg.to_i}
            if args.length == 1
            @list.print_full_item(*args)
            else
                @list.print(*args)
            end
        when 'toggle'
            args.map! {|arg| arg.to_i}
            @list.toggle_item(*args)
        when 'rm'
            @list.remove_item(*args)
        when 'quit'
            return false
        else
            print "Sorry, that command is not recognized."
        end

        true
    end
    
    def run 
        while get_command
            get_command
        end
    end
end