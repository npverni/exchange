class TicketsController < ApplicationController
  before_filter :get_show, :login_required 
  def new
    @ticket = @show.tickets.new
  end

  def create
    @ticket = @show.tickets.new(params[:ticket])
    @ticket.user = current_user

    respond_to do |format|
      if @ticket.save
        flash[:notice] = 'Tickets were successfully created.'
        format.html { redirect_to(@show) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rental.errors, :status => :unprocessable_entity }
      end
    end
  end

  protected
    def get_show
      @show = Show.find_by_show_date(Date.strptime(params[:show_id], '%Y-%m-%d'))
      if @show
        set_title "Add Ticket - #{@show.friendly_name}"
      else
        redirect_to '/'
      end    
    end  
end

