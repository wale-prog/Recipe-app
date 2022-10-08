class AddDeleteCascadeToFood < ActiveRecord::Migration[7.0]
  def change
    remove_reference :recipe_foods, :food, null: false, foreign_key: true
    add_reference :recipe_foods, :food, foreign_key: { on_delete: :cascade }
  end
end
