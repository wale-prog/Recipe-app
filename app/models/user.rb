class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :foods
  has_many :recipes

  validates :name, presence: true, length: { minimum: 3, maximum: 75 }

  Roles = [ :admin, :default ]

  def is?( requested_role )
    self.role == requested_role.to_s
  end

end
