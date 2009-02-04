require 'test_helper'

class VenueTest < Test::Unit::TestCase
  
  should_have_many :shows
  
  should_have_db_column :city, :type => :string
  should_have_db_column :state, :type => :string
end