class Computer
    def initialize
        @name = "Computer"
        @valid_guesses = ("1111".."6666").to_a.reject { |guess| guess =~ /[07-9]/ }.map { |guess| guess = guess.split(//).map(&:to_i)}
        @feedback = [[7, 7, 7, 7], 0, 0]
    end

    def guess_secret
        get_feedback
        computer_guess = @valid_guesses.sample
        printf "I will guess the combination is #{computer_guess.join()}. I have #{@valid_guesses.size} choices to guess from."
        sleep 3
        computer_guess
    end

    def get_feedback
        @valid_guesses.select! { |secret| matches_feedback(secret) }
    end

    def matches_feedback(secret)
        guess, right_guess, wrong_guess = @feedback
        guess = guess
        secret = secret
        right_guess == right_pos(secret, guess) and wrong_guess == wrong_pos(secret, guess)
    end

    def right_pos(secret, guess)
        guess.select.with_index { |peg, i| secret[i] === peg }.size
    end

    def wrong_pos(secret, guess)
        count = 0
        (1..6).each { |peg| count += [secret.count(peg), guess.count(peg)].min }
        count -= right_pos(secret, guess)
        count
    end

    def name
        @name
    end

    def feedback=(value)
        @feedback = value
    end
end