class AddCommentsToTickets < ActiveRecord::Migration
  def self.up
    add_column :tickets, :notes, :text
    add_column :wants, :notes, :text    
  end

  def self.down
    remove_column :tickets, :notes
    remove_column :wants, :notes    
  end
end
