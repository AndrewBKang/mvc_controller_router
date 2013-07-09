class AddFavoritesColumn < ActiveRecord::Migration
  def change
    add_column :users, :token, :string
    add_column :contacts, :favorite, :boolean, :default => :false
  end

end
