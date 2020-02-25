class EventsController < ApplicationController
  def index
    @current_events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    redirect_to root_path
  end

  private
    def event_params
      params.require(:event).permit(:title, :place, :event_start_at, :event_end_at, :expire_at, :discription, :capacity).merge(organizer_id: current_user.id)
    end
  end
