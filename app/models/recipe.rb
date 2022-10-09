class Recipe < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :recipe_foods, dependent: :delete_all
  has_many :foods, through: :recipe_foods

  validates :name, :description, :preparation_time, :cooking_time, presence: true
  validates :public, inclusion: { in: [true, false] }
end
