class AddUserToFood < ActiveRecord::Migration[7.0]
  def change
    add_reference :foods, :user, null: false, foreign_key: true
    add_reference :recipes, :user, null: false, foreign_key: true
  end
end
