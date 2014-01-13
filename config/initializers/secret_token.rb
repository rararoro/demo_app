# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#DemoApp::Application.config.secret_key_base = '56e10e02da059de553d462928dab61a41e587d2cc036274b11898e24caf5801232cb9bba43cefa895b4b1e86cea648396a0ec63e567d0dba435e04260fdbb685'
require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist_(token_file)
		#Use the existing token.
		File.read(token_file).chomp
	else
		#Generate a new token and store it in token_file.
		token = SecureRandom.hex(64)
		File.write(token_file,token)
		token
	end
end

DemoApp::Application.config.secret_key_base = secure_token