class CreateTheDiscussions < ActiveRecord::Migration
  def change
    create_table :the_discussions do |t|
      t.string :topic

      t.timestamps null: false
    end
  end
end
