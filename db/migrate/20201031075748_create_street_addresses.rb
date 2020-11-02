class CreateStreetAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :street_addresses do |t|
      t.string :post_number,     null:false
      t.integer :sender_id,     null:false
      t.string :municipality,        null:false
      t.string :building_name
      t.string :address,            null:false
      t.string :phone_number,        null:false
      t.references :order,             foreign_key: true
      t.timestamps 
    end
  end
end
