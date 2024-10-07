class AddColumnPaidToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :paid, :boolean
  end
end
