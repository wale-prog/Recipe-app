class Food < ApplicationRecord
  has_many :recipe_foods
  belongs_to :user

  validates :name, presence: true, length: { minimum: 3, maximum: 75 }
  validates :measurement_unit, presence: true, length: { minimum: 1, maximum: 10 }
  validates :price, presence: true, length: { minimum: 1, maximum: 10 }
  validates :quantity, presence: true, length: { minimum: 1, maximum: 10 }
end
