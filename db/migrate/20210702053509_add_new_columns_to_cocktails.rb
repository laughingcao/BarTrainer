class AddNewColumnsToCocktails < ActiveRecord::Migration[6.1]
  def change
    add_column :cocktails, :garnish, :string
    add_column :cocktails, :glassware, :string
    add_column :cocktails, :ice_type, :string
  end
end
