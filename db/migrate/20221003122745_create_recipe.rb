class CreateRecipe < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.time :preperation_time
      t.time :cooking
      t.string :description
      t.boolean :public

      t.timestamps
    end
  end
end
