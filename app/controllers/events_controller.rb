class EventsController < ApplicationController
  def index
    @current_events = Event.order(created_at: :desc).limit(5)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.valid?
      @event.save
      redirect_to root_path and return
    else
      @event.errors
      @errors = @event.errors.full_messages 
      render :new, params: @errors and return
    end

  end

  private
    def event_params
      params.require(:event).permit(:title, :img, :place, :event_start_at, :event_end_at, :expire_at, :discription, :capacity).merge(organizer_id: current_user.id)
    end
  end
