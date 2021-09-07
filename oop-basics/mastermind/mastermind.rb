require_relative "player"
require_relative "computer"

class Game
    PEGS = (1..6).to_a
    def initialize
        @secret = Array.new(4) { PEGS.sample }
        @guesses = Hash.new(0)
        @player = Player.new
    end

    def play
        player_select
        10.times do |i|
            guess = prompt_guess
            print
            if win?(guess)
                puts "GOOD JOB, #{@player.name}! YOU HAVE FOUND THE SECRET CODE! IT IS #{@secret}"
                return guess
            end
        end
        puts "Sorry, the secret code was #{@secret}"    
    end

    def prompt_guess
        guess = @player.guess_secret
        right_guess = right_pos(guess)
        wrong_guess = wrong_pos(guess)
        @player.feedback = [guess, right_guess, wrong_guess]
        @guesses[guess] = "Right place: #{right_guess}, Wrong place: #{wrong_guess}"
        guess
    end

    def print
        system ("cls")
        system("clear")
        @guesses.each.with_index(1) do |(key, value), i|
            format_guess = key.join(", ")
            puts "#{i}) Your guess: #{format_guess}. #{value}"
        end
        sleep 3
    end

    def right_pos(guess)
        guess.select.with_index { |peg, i| @secret[i] === peg }.size
    end

    def wrong_pos(guess)
        count = 0
        PEGS.each { |peg| count += [@secret.count(peg), guess.count(peg)].min }
        count -= right_pos(guess)
        count
    end

    def player_select
        puts "You can either pick the code or guess. Do you want to guess? (y/n): "
        choice = gets.chomp
        if choice == "y"
            define_player_secret
            @player = Computer.new
        end
        print
    end

    def define_player_secret
        begin
            #... process, may raise an exception
            puts "please enter a four digits code, using numbers 1 to 5 (e.g. 4154): "
            @secret = gets.chomp
            @secret = @secret.split(//).map(&:to_i)
            raise "Invalid input" unless @secret.size == 4 and @secret.all? { |peg| 1 <= peg and peg <= 6 }
        rescue Exception => e
            #... error handler
            puts "Exception Class: #{ e.class.name }"
            puts "Exception Message: #{ e.message }"
            puts "Exception Backtrace: #{ e.backtrace }"
            @secret = Array.new(4) { PEGS.sample }
            puts " "
            puts "Sorry, #{@player.name}. You have entered a strange input. The secret code is now #{@secret}."
            sleep 5
            @secret
        else
            #... executes when no error
            return @secret
        end
    end

    def win?(guess)
        right_pos(guess) == 4
    end
end

g = Game.new
g.play