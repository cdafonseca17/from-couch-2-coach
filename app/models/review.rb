class Review < ApplicationRecord
  belongs_to :course
  validates :stars, inclusion: { in: [1, 2, 3, 4, 5] }
  validates :description, length: { minimum: 10 }
end
