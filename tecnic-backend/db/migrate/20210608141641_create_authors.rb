class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.integer :author_type, default: 1
      t.string :blog
      t.string :rss, null: false
      t.string :description
      t.string :github
      t.string :facebook
      t.string :linkedin
      t.string :twitter

      t.timestamps

      t.index [:name], name: "index_authors_on_name"
      t.index [:rss], name: "index_authors_on_rss_unique", unique: true
    end
  end
end
