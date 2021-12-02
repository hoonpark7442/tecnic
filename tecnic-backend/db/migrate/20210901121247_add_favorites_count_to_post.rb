class AddFavoritesCountToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :favorites_count, :integer, default: 0, null: false
  end
end
