class Course < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :timeslots, dependent: :destroy
  validates :name, presence: true
  validates :category, presence: true
  validates :description, length: { minimum: 10 }
  validates :address, presence: true
  include PgSearch::Model
  pg_search_scope :search_by_category_and_city,
    against: [:category, :city],
    using: {
      tsearch: { prefix: true }
    }
  pg_search_scope :search_by_category,
    against: [:category],
    using: {
      tsearch: { prefix: true }
    }
  pg_search_scope :search_by_category_city_date,
    against: [:category, :city, :date],
    using: {
      tsearch: { prefix: true }
    }
end
