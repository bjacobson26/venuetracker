require 'bcrypt' #this must be at the top of the file

class User < ActiveRecord::Base
	has_many :user_venues
	has_many :venues, through: :user_venues
	has_secure_password

	validates_presence_of :name,
											  :email
											  
											  

	validates_uniqueness_of :email
													
	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

	validates_length_of :name, maximum: 25
	validates_length_of :email, maximum: 50
	validates_length_of :password, minimum: 3
	
	


	


end
