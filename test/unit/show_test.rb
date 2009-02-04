require 'test_helper'

class ShowTest < Test::Unit::TestCase
  
  should_belong_to :venue
  should_have_many :tickets
  should_have_many :wants
  
  should_have_db_column :show_date, :type => :datetime
  should_have_db_column :venue_id, :type => :integer

  should_require_attribute :quantity
  
  context "Statistical instante methods" do
    setup do
      @venue = Factory(:venue, :name => 'Jones Beach', :city => 'Wantagh', :state => 'NY')
      @show = Factory(:show, :show_date => DateTime.new(2009,6,4))
      @tickets = []
      @wants = []

      5.times do
        tickets << Factory(:ticket, :quantity => 2, :show => @show)
      end
      5.times do
        wants << Factory(:want, :quantity => 3, :show => @show)
      end
    end    
    
    should "display the total posts" do
      assert_equal 10, @show.total_posts 
    end
    
    should "display the total tickets available" do
      assert_equal 10, @show.ticket_count
    end
    
    should "display the total demand for the show" do
      assert_equal 15, @show.wants_count      
    end
    
    should "display the total rides needed" do
      assert_equal 10, @show.rides_count            
    end
    
    should "display the availability ratio" do
      assert_equal 0.67, @show.ratio                  
    end
  end
  
  
  context "display helpers" do
    setup do      
      @venue = Factory(:venue, :name => 'Jones Beach', :city => 'Wantagh', :state => 'NY')
      @show = Factory(:show, :show_date => DateTime.new(2009,6,4), :venue => @venue)
    end
    
    should "display a fiendly show name" do
      assert_equal @show.friendly_name, "06/04/09 Jones Beach"
    end
  end
  
  context "Statiscal class methods" do
    setup do      
      @venue = Factory(:venue, :name => 'Jones Beach', :city => 'Wantagh', :state => 'NY')
      @show = Factory(:show, :show_date => DateTime.new(2009,6,4))
      @tickets = []
      @wants = []

      5.times do
        @tickets << Factory(:ticket, :quantity => 2, :show => @show)
      end
      5.times do
        @wants << Factory(:want, :quantity => 3, :show => @show)
      end
      
      @show2 = Factory(:show, :show_date => DateTime.new(2009,6,5))
      @tickets2 = []
      @wants2 = []

      5.times do
        @tickets2 << Factory(:ticket, :quantity => 2, :show => @show)
      end
      5.times do
        @wants2 << Factory(:want, :quantity => 3, :show => @show)
      end
      
    end    
    
    should "display the total posts" do
      assert_equal 20, Show.total_posts
    end
    
    should "display the total tickets available" do
      assert_equal 20, Show.total_ticket_count
    end
    
    should "display the total demand for the show" do
      assert_equal 30, Show.total_wants_count      
    end
    
    should "display the total rides needed" do
      assert_equal 20, Show.total_rides_count            
    end
    
    should "display the availability ratio" do
      assert_equal 0.67, Show.total_ratio                  
    end    
  end
end