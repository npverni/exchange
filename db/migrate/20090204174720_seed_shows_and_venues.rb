class SeedShowsAndVenues < ActiveRecord::Migration
  def self.up
    v= Venue.create(:name => 'Nikon at Jones Beach Theater', :city => 'Wantagh', :state => 'NY')
    s = Show.create(:venue => v, :show_date => DateTime.new(2009,6,4))
    s = Show.create(:venue => v, :show_date => DateTime.new(2009,6,5))
  end

  def self.down
  end
end
