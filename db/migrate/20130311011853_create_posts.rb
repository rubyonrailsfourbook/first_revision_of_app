class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.text :content
      t.datetime :published_on
      t.integer :user_id

      t.timestamps
    end
  end
end
