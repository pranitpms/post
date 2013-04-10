class EventController < ApplicationController
  def index
  	@event = Event.find(params[:id])
  end

  def show
  end

  def edit
  	@event = Event.find(params[:id])
  end

  def update
  	@event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
  	@event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to event_url }
      format.json { head :no_content }
    end
  end
end
