class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[create edit destroy]
  before_action :find_event, except: %i[new create index]
  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.new(event_params)
    if @event.save
      flash[:success] = "Event created successfully"
      redirect_to :events
    else
      render :new
    end
  end

  def edit;end

  def update
    if @event.update(event_params)
      flash[:success] = "Event updated successfully"
      redirect_to :events
    else
      render :edit
    end
  end

  def index
    @events = Event
                .active
                .with_attached_image
                .paginate(page: params[:page], per_page: 9)
  end

  def show;end

  def destroy
    @event.destroy
    redirect_to :events
  end

  private

  def event_params
    params.require(:event).permit(
      :name, :description, :start_time, :end_time, :address,
      :image, :paid
    )
  end

  def find_event
    @event = Event.find_by(id: params[:id])
  end
end
