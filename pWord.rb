require 'zxcvbn'
require 'securerandom'
require 'set'
require 'digest'

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

# set that stores previously generated passwords
password = Set.new

# load previously generated password hashes from file
if File.exist?('passwords.txt')
	File.readlines('passwords.txt').each do |line|
		passwords.add(line.strip)
	end
end

# generate new password
password = generate_password(password_length)

# create hash of password
password_hash = Digest::SHA256.hexdigest(password)

# check if password hash has been generated before
while passwords.include?(password_hash)
	# generate new if it has been generated before
	password = generate_password(password_length)
	password_hash = Digest::SHA256.hexdigest(password)
end


# add new password hash to set of previously generated passwords
passwords.add(password_hash)

# write new password hash to file
File.open('passwords.txt', 'a') { |file| file.puts(password_hash) }

puts "generated password: #{password}"
strength = Zxcvbn.test(password)
puts "password strength: #{strength.score}"