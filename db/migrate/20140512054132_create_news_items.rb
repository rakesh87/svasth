class CreateNewsItems < ActiveRecord::Migration
  def change
    create_table :news_items do |t|
      t.integer :user_id
      t.string :title
      t.text :body

      t.timestamps
    end

    add_index :news_items, :user_id
  end
end
