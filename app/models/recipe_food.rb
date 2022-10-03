class Reciepe_food < ApplicationRecord
	belongs_to :food
	belongs_to :recipe
end