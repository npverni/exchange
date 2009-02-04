class DashController < ApplicationController

  def index
    @shows = Show.chrono
    
    @total_posts = Show.total_posts
    @total_extras = Show.total_ticket_count
    @total_demand = Show.total_wants_count
    @total_ratio = Show.total_ratio
    @total_rides = Show.total_rides_count
  end

end
