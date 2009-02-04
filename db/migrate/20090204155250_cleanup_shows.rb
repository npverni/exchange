class CleanupShows < ActiveRecord::Migration
  def self.up
    remove_column :shows, :venue
  end

  def self.down
  end
end
