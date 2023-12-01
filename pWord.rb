require 'zxcvbn'
require 'securerandom'

def generate_password(length = 12)
	SecureRandom.alphanumeric(length)
end

# check if argument was provided
if ARGV[0]
	# convert arg to integer and use it as password length
	password_length = ARGV[0].to_i
else
	# default password length
	password_length = 12
end

password = generate_password
puts "generated password: #{password}"

strength = Zxcvbn.test(password)
puts "password strength: #{strength.score}"