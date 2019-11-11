class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :timeslot
  # no validations?
end
