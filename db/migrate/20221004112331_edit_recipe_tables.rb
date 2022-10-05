class EditRecipeTables < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipes, :preperation_time
    remove_column :recipes, :cooking
    remove_column :recipes, :description
    add_column :recipes, :preparation_time, :string
    add_column :recipes, :cooking_time, :string
    add_column :recipes, :description, :text
  end
end
