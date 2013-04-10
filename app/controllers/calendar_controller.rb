class CalendarController < ApplicationController
  before_filter :authenticate_user!

  

  def index
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)

    @event_strips = Event.event_strips_for_month(@shown_month)
  end
  
  def day

  	 @event = Event.new
  end

   def create

   	@event = Event.new(params[:event])
    respond_to do |format|
      if @event.save
       format.html { redirect_to calendar_path, notice: 'Post was successfully created.' }
        format.json { render json: calendar_path, status: :created, location: @post }
     end
    end
end
end
