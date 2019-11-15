class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :courses
  has_many :appointments
  # validates :username, uniqueness: true
  # validates :password, length: { within: 6..40 }
  validates :email, presence: true
  # validates :phone_number, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :city, presence: true
  # validates :gender, presence: true
  validates :user_type, presence: true
  mount_uploader :photo, PhotoUploader
end

# More complicated password validation we can use:
# from: https://stackoverflow.com/questions/5123972/ruby-on-rails-password-validation

# #   PASSWORD_FORMAT = /\A
# #   (?=.{8,})          # Must contain 8 or more characters
# #   (?=.*\d)           # Must contain a digit
# #   (?=.*[a-z])        # Must contain a lower case character
# #   (?=.*[A-Z])        # Must contain an upper case character
# #   (?=.*[[:^alnum:]]) # Must contain a symbol
# # /x

# # validates :password,
# #   presence: true,
# #   length: { in: Devise.password_length },
# #   format: { with: PASSWORD_FORMAT },
# #   confirmation: true,
# #   on: :create
