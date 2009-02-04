class CreateVenues < ActiveRecord::Migration
  def self.up
    create_table :venues do |t|
      t.string :name
      t.string :city
      t.string :state
      t.timestamps
    end
    
    remove_column :shows, :state
    remove_column :shows, :city
    add_column :shows, :venue_id, :integer
  end

  def self.down
    remove_column :shows, :venue_id
    drop_table :venues
  end
end
