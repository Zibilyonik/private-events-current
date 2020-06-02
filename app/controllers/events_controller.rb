class EventsController < ApplicationController
  def index
    @events = Events.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    redirect_to @event.user
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date)
  end
end
