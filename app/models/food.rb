class Food < ApplicationRecord
  has_many :recipe_foods
  belongs_to :user
  has_many :recipes, through: :recipe_foods

  validates :name, :measurement_unit, :price, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
