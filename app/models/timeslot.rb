class Timeslot < ApplicationRecord
  belongs_to :course
  has_many :appointments
  validates :date, presence: true
  validates :time, presence: true
end
