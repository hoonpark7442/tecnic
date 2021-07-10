class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :author, null: false, foreign_key: true
      t.string :title, null: false
      t.string :link, null: false
      t.datetime :post_date

      t.timestamps
    end
  end
end
