class AddColumnIndustryToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :industry, :string
  end
end
