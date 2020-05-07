class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :title,          null: false 
      t.text :content,        null: false 
      t.integer	:user_id,     null: false ,foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
