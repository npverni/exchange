class ColumnTypeSwitch < ActiveRecord::Migration
  def self.up
    remove_column :tickets, :show_id
    add_column :tickets, :show_id, :integer
  end

  def self.down
  end
end
