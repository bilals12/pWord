require 'securerandom'

def generate_password(length = 12)
	SecureRandom.alphanumeric(length)
end

password = generate_password
puts "generated password: #{password}"

# write password to file
File.open('password.txt', 'w') { |f| f.puts(password) }

# run john the ripper on password file
system("john --format=Raw-MD5 --test password.txt")