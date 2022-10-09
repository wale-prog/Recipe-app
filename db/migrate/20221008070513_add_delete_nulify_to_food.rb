class AddDeleteNulifyToFood < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :recipe_foods, :foods
    add_foreign_key :recipe_foods, :foods, on_delete: :nullify
    remove_reference :recipe_foods, :recipe, null: false, foreign_key: true
    add_reference :recipe_foods, :recipe, foreign_key: true
  end
end
