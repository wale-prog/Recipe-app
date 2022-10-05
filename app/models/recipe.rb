class Recipe < ApplicationRecord
  # has_many recipe_foods
  belongs_to :user

  validates :name, presence: true, length: { minimum: 3, maximum: 75 }
  validates :description, presence: true, length: { minimum: 3, maximum: 1000 }
  validates :preparation_time, presence: true, length: { minimum: 3, maximum: 10 }
  validates :cooking_time, presence: true, length: { minimum: 3, maximum: 10 }
end
