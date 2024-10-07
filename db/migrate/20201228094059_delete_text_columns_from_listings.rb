class DeleteTextColumnsFromListings < ActiveRecord::Migration[6.1]
  def change
    remove_column :listings, :description
    remove_column :listings, :how_to_apply
    remove_column :listings, :company_about
  end
end
