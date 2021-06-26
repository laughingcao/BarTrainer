class CreateCocktails < ActiveRecord::Migration[6.1]
  def change
    create_table :cocktails do |t|
      t.string :name
      t.string :instructions
      t.integer :user_id

      t.timestamps
    end
  end
end
