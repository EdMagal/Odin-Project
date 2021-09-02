=begin
Implement a caesar cipher that takes in a string and the shift factor and then outputs the modified string:
=end

def caesar_cipher(text, offset=1)
    cipher = ''

    text.each_char do |char|
        cipher_char = char
        if /[a-z]/ =~ char
            cipher_char = ((char.ord + offset - 97)%26 + 97).chr
        elsif /[A-Z]/ =~ char
            cipher_char = ((char.ord + offset - 65)%26 + 65).chr
        end
        cipher += cipher_char
    end

    cipher
end

p caesar_cipher("Hello World!", 1) # "Ifmmp Xpsme!"
p caesar_cipher("Veni, vidi, vici", -3) # "Sbkf, sfaf, sfzf"
p caesar_cipher("T#E$S%T¨ U&&AIRir91", 5) # "Y#J$X%Y¨ Z&&FNWnw91"
p caesar_cipher("Hello World!", 26) # "Hello World!"

