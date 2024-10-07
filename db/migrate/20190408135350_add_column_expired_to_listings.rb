class AddColumnExpiredToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :expired, :boolean
  end
end
