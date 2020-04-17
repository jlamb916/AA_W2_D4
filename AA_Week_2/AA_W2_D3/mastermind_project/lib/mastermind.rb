require_relative "code"

class Mastermind

    def initialize(len)
        @secret_code = Code.random(len)
    end

    def print_matches(code)
        puts code.num_exact_matches(@secret_code)
        puts code.num_near_matches(@secret_code)
    end

    def ask_user_for_guess
        puts "Enter a code"
        user = gets.chomp
        user_code = Code.from_string(user)
        puts @secret_code.num_exact_matches(user_code)
        puts @secret_code.num_near_matches(user_code)
        user_code == @secret_code 
    end
end
