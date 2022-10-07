class Recipe < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods

  validates :name, presence: true, length: { minimum: 3, maximum: 75 }
  validates :description, presence: true, length: { minimum: 3, maximum: 1000 }
  validates :preparation_time, presence: true, length: { minimum: 3, maximum: 10 }
  validates :cooking_time, presence: true, length: { minimum: 3, maximum: 10 }
end
