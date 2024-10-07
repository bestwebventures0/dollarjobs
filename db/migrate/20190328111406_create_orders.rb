class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :listing_id
      t.float :price
      t.string :status
      t.string :payment_id

      t.timestamps
    end
  end
end
