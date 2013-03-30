class User < ActiveRecord::Base
	validates_presence_of :name, :email, :password

	validates_length_of :password, within: 6..512

	validates_as_email_address :email, strict: false

	has_secure_password

	validates_uniqueness_of :email, case_sensitive: false, on: :create

	before_save { email.downcase! }

	has_many :posts

	has_many :comments

end
