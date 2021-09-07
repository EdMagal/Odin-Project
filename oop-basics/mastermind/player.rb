class Player
    def initialize
        printf "Hello, please enter your name: "
        @name = gets.chomp
        @feedback = ["7777", 0, 0]
    end

    def guess_secret
        printf "\nPlease try to guess the 4 digits code using numbers 1-5 (e.g. 1342): "
        guess = gets.chomp
        guess.split(//).map(&:to_i)
    end

    def name
        @name
    end

    def feedback=(value)
        @feedback = value
    end
end
