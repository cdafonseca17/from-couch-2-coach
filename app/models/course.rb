class Course < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :category, presence: true
  validates :description, length: { minimum: 10 }
  validates :address, presence: true
end
