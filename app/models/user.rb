class User < ActiveRecord::Base
	validates_presence_of :name, :email

	validates_as_email_address :email

	has_secure_password
end
