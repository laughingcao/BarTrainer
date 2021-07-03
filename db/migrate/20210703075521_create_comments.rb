class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :comment_text
      t.integer :user_id
      t.integer :cocktail_id

      t.timestamps
    end
  end
end
