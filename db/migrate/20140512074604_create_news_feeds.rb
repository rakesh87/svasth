class CreateNewsFeeds < ActiveRecord::Migration
  def change
    create_table :news_feeds do |t|
      t.integer :user_id
      t.integer :news_item_id
      t.boolean :status, default: false

      t.timestamps
    end

    add_index :news_feeds, [:user_id, :news_item_id], unique: true
  end
end
