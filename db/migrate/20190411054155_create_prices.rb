class CreatePrices < ActiveRecord::Migration[5.2]
  def change
    create_table :prices do |t|
      t.integer :basic
      t.integer :sticky
      t.integer :highlight
      t.integer :logo_displayed
      t.boolean :active

      t.timestamps
    end
  end
end
