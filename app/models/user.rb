class User < ApplicationRecord
  has_many :foods
  has_many :recipes

	validates :name, presence: true, length: { minimum: 3, maximum: 75 }
end
