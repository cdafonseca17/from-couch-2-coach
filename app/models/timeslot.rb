class Timeslot < ApplicationRecord
  belongs_to :course
  has_one :appointment
  validates :date, presence: true
  validates :time, presence: true
end
