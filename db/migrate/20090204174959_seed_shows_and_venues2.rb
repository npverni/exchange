class SeedShowsAndVenues2 < ActiveRecord::Migration
  def self.up

    v= Venue.create(:name => 'Comcast Center ', :city => 'Mansfield', :state => 'MA')
    s = Show.create(:venue => v, :show_date => DateTime.new(2009,6,6))

    v= Venue.create(:name => 'Susquehanna Bank Center ', :city => 'Camden', :state => 'NJ')
    s = Show.create(:venue => v, :show_date => DateTime.new(2009,6,7))

    v= Venue.create(:name => 'Asheville Civic Center', :city => 'Ashville', :state => 'NC')
    s = Show.create(:venue => v, :show_date => DateTime.new(2009,6,9))
    
    v= Venue.create(:name => 'Thompson-Boling Arena', :city => 'Knoxville', :state => 'TN')
    s = Show.create(:venue => v, :show_date => DateTime.new(2009,6,10))

    v= Venue.create(:name => 'Fox Theatre', :city => 'St. Louis', :state => 'MO')
    s = Show.create(:venue => v, :show_date => DateTime.new(2009,6,16))

    v= Venue.create(:name => 'Post Gazette Pavilion', :city => 'Burgettstown', :state => 'PA')
    s = Show.create(:venue => v, :show_date => DateTime.new(2009,6,18))

    v= Venue.create(:name => 'Verizon Wireless Music Center', :city => 'Noblesville', :state => 'IN')
    s = Show.create(:venue => v, :show_date => DateTime.new(2009,6,19))

    v= Venue.create(:name => 'Alpine Valley Music Theater', :city => 'East Troy', :state => 'WI')
    s = Show.create(:venue => v, :show_date => DateTime.new(2009,6,20))
    s = Show.create(:venue => v, :show_date => DateTime.new(2009,6,21))    
  end

  def self.down
  end
end
