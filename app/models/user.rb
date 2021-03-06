class User < ApplicationRecord
	before_save { self.email = email.downcase }
	validates :name, presence: true, length: {maximum: 20}
	validates :email, presence: true, length: {maximum: 30},
	uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: {minimum: 6}
	has_secure_password
end
