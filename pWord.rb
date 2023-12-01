require 'securerandom'

def generate_password(length = 12)
	SecureRandom.alphanumeric(length)
end

password = generate_password
puts "generated password: #{password}"

# run john the ripper directly on password
IO.popen("john --stdin --format=Raw-MD5 --test", "w") { |f| f.puts(password) }