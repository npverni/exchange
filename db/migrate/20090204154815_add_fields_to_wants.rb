class AddFieldsToWants < ActiveRecord::Migration
  def self.up
    add_column :wants, :quantity, :integer
    add_column :wants,  :section, :string
    add_column :wants,  :needs_ride, :boolean, :default => false
    add_column :wants,  :show_id, :integer
    add_column :wants,  :user_id, :integer


    add_column :wants,  :will_accept_cash, :boolean, :default => false
    add_column :wants,  :will_accept_trade, :boolean, :default => false

  end

  def self.down
    remove_column :watns, :quantity
  end
end
