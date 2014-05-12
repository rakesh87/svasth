class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :user_id
      t.integer :news_item_id

      t.timestamps
    end

    add_index :comments, :user_id
    add_index :comments, :news_item_id
  end
end
