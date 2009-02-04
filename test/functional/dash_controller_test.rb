require 'test_helper'

class DashControllerTest < ActionController::TestCase

  context "on GET to :index" do
    setup do      
      get :index
    end
 
    should_assign_to :shows, :total_posts, :total_extras, :total_demand, :total_ratio, :total_rides
                     
    should_respond_with_content_type 'text/html'                     
  end

end
