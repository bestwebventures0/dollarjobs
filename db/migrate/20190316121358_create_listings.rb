class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.integer :category_id
      t.string :location
      t.text :how_to_apply
      t.string :company_name
      t.string :company_website
      t.string :company_email
      t.text :company_about
      t.boolean :highlight
      t.boolean :sticky
      t.boolean :logo_displayed

      t.timestamps
    end
  end
end
