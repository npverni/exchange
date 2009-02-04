require 'test_helper'

class TicketTest < Test::Unit::TestCase
  
  should_belong_to :show
  should_belong_to :user
  
  should_have_db_column :show_id, :type => :integer
  should_have_db_column :user_id, :type => :integer  
  should_have_db_column :quantity, :type => :integer
  should_have_db_column :section, :type => :string
  should_have_db_column :needs_ride, :type => :boolean, :default => false
end
