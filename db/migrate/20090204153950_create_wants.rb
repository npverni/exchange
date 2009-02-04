class CreateWants < ActiveRecord::Migration
  def self.up
    create_table :wants do |t|
      t.timestamps
    end
  end

  def self.down
    drop_table :wants
  end
end
