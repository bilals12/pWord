require 'zxcvbn'
require 'securerandom'

def generate_password(length = 12)
	SecureRandom.alphanumeric(length)
end

password = generate_password
puts "generated password: #{password}"

strength = Zxcvbn.test(password)
puts "password strength: #{strength.score}"