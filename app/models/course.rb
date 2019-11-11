class Course < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :timeslots
  validates :name, presence: true
  validates :category, presence: true
  validates :description, length: { minimum: 10 }
  validates :address, presence: true
end
