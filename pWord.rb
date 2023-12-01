require 'securerandom'

def generate_password(length = 12)
	SecureRandom.alphanumeric(length)
end

password = generate_password
puts "generated password: #{password}"
File.open('password.txt', 'w') { |f| f.puts(password) }