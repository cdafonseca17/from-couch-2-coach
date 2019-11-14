class Course < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :timeslots, dependent: :destroy
  validates :name, presence: true
  validates :category, presence: true
  validates :description, length: { minimum: 10 }
  validates :address, presence: true
  mount_uploader :photo, PhotoUploader, presence: true
end
