class Timeslot < ApplicationRecord
  belongs_to :course
  validates :date, presence: true
  validates :time, presence: true
end
