class WantsController < ApplicationController

  before_filter :get_show, :login_required 
  def new
    @want = @show.wants.new
  end

  def create
    @want = @show.wants.new(params[:want])
    @want.user = current_user

    respond_to do |format|
      if @want.save
        flash[:notice] = 'Request was successfully created.'
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
        set_title "Add Request - #{@show.friendly_name}"
      else
        redirect_to '/'
      end    
    end  
end

