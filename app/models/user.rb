class User < ApplicationRecord
	before_save { self.email = email.downcase }
	validates :name, presence: true, length: {maximum: 20}
	validates :email, presence: true, length: {maximum: 30},
	uniqueness: { case_sensitive: false }
end
