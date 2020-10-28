class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                 null:false
      t.text :description,            null:false
      t.integer :category_id,         null:false
      t.integer :status_id,           null:false
      t.integer :shippingcharges_id,  null:false
      t.integer :sender_id,           null:false
      t.integer :scheduleddelivery_id,    null:false
      t.integer :price,               null:false
      t.references :user,             foreign_key: true
      t.timestamps
    end
  end
end
