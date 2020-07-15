class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[create edit destrooy]
  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.new(event_params)
    if @event.save
      flash[:success] = "Event created successfully"
      redirect_to :root
    else
      # binding.pry
      render :new
    end
  end

  def edit
  end

  def index
    @events = Event.active
  end

  private

  def event_params
    params.require(:event).permit(
      :name, :description, :start_time, :end_time, :address, :image
    )
  end
end
