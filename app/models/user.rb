class User < ApplicationRecord
  validates :username, uniqueness: true
  validates :password, length: { within: 8..40 }
  validates :email, format: { with: /\A.*@.*\.com\z/ }
  validates :phone_number, numericality: true, length: { minimum: 10, maximum: 15 }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :city, presence: true
  validates :gender, presence: true
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
