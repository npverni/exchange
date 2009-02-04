class ForeignKeysForTickets < ActiveRecord::Migration
  def self.up
    add_column :tickets, :user_id, :integer
    add_column :tickets, :show_id, :string
  end

  def self.down
    remove_column :ticekts, :show_id
    remove_column :tickets, :user_id
  end
end
