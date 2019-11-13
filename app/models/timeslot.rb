class Timeslot < ApplicationRecord
  belongs_to :course
  has_one :appointment
  validates :date, presence: true
  validates :time, presence: true

  def timeslot_label
    "Date: #{date} Time: #{time}"
  end
end
