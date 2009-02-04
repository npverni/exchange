require 'test_helper'

class ShowsControllerTest < ActionController::TestCase
  context "on GET to :show" do
    setup do
      @venue = Factory(:venue, :name => 'Jones Beach', :city => 'Wantagh', :state => 'NY')
      @show = Factory(:show, :show_date => DateTime.new(2009,6,4), :venue => @venue)      
      get :show, :id => @show.to_param
    end
 
    should_assign_to :show
                     
    should_respond_with_content_type 'text/html'                     
  end
end
