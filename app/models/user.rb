class User < ApplicationRecord
	has_many :posts, dependent: :destroy
	has_many :comments, through: :posts
  has_many :replies
  has_and_belongs_to_many :subcategories
	attr_accessor :password_confirmation
	before_validation :cal_age
	before_save :downcase_email
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :user_name, presence: true, length: { minimum: 6 }, uniqueness: true
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
	validates :contact_number, length: { is: 10 }
	validates :password, presence: true, length: { minimum: 6 }
	validates :age, numericality: { greater_than_or_equal_to: 0, message: 'is not valid. Please enter valid date of birth' }
	validate :valid_password

	private
		def downcase_email
			self.email = email.downcase
		end

		def valid_password
			errors.add(:base, "Password do not match") if password != password_confirmation
		end

		def cal_age
			if date_of_birth
  				self.age = ((Time.zone.now - date_of_birth.to_time) / 1.year.seconds).floor
  			else
  				errors.add(:base, "Please enter date of birth")
  			end
		end
end
