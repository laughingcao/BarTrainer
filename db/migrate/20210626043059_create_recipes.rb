class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :quantity
      t.integer :cocktail_id
      t.integer :ingredient_id
      
      t.timestamps
    end
  end
end
