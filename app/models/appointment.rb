class Appointment < ApplicationRecord
  belongs_to :course
  belongs_to :user
  # no validations?
end
