class BoolIx < ActiveRecord::Migration
  def self.up
    remove_column :tickets, :needs_ride
    add_column :tickets, :needs_ride, :boolean, :default => false    
  end

  def self.down
    add_column :tickets, :needs_ride, :boolean
    remove_column :tickets, :needs_ride
  end
end
