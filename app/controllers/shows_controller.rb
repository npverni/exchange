class ShowsController < ApplicationController
  
  def show
    @show = Show.find_by_show_date(Date.strptime(params[:id], '%Y-%m-%d'))
    if @show
      set_title @show.friendly_name      
    else
      redirect_to '/'
    end
  end
  
end
