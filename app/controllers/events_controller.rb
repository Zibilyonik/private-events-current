class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def attend
    @event = Event.find(params[:id])
    @event.attendees << current_user
    @event.save!
    redirect_to event_path(@event)
  end

  def withdraw
    @event = Event.find(params[:id])
    @event.attendees.delete(current_user)
    @event.save!
    redirect_to event_path(@event)
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date)
  end
end
