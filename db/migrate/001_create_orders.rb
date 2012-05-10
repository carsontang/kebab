class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :email
      t.string  :street_address
      t.integer :phone_number
      t.text    :delivery_instruction
      t.integer :beef_count
      t.integer :chicken_count
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :orders
  end
end