require 'bcrypt'

class User < ActiveRecord::Base
	attr_accessor :new_password, :new_password_confirmation

	validates :email, presence: true, uniqueness: true
	
	validates_confirmation_of :new_password

	before_save do |user|
		unless user.new_password.blank? then
			user.hashed_password = BCrypt::Password.create(user.new_password)
		end
	end

	def self.authenticate(email, password) 
		if user = User.find_by_email(email)
			if BCrypt::Password.new(user.hashed_password).is_password? password
				return user
			end
		end

		return nil
	end
end
