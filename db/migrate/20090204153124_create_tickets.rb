class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.integer :quantity
      t.string :section
      t.boolean :needs_ride
      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end
