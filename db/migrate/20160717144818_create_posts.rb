class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :text
      t.integer :user_id
      t.integer :the_discussion_id

      t.timestamps null: false
    end
  end
end
