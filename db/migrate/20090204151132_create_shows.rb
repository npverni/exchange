class CreateShows < ActiveRecord::Migration
  def self.up
    create_table :shows do |t|
      t.datetime :show_date
      t.string :venue
      t.string :city
      t.string :state

      t.timestamps
    end
  end

  def self.down
    drop_table :shows
  end
end
