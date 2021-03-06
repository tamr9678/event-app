class EventsController < ApplicationController
  def index
    @current_events = Event.order(created_at: :desc).limit(5)
    @popular_events = Event.find(Favorite.group(:event_id).order('count(event_id) desc').limit(5).pluck(:event_id))
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

  def edit
    @event = Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id])
    event.update(event_params)
    redirect_to event_path(params[:id])
  end

  def show
    @event = Event.find(params[:id])
    @participants = Participant.where(event_id: params[:id])
    @favorites = Favorite.where(event_id: params[:id])
    if user_signed_in?
      @entry_status = @event.entry_status(@participants,current_user.id)
    end
    gon.latitude = @event.latitude
    gon.longitude = @event.longitude
  end

  private
    def event_params
      params.require(:event).permit(:title, :img, :place, :event_start_at, :event_end_at, :expire_at, :discription, :capacity, :latitude, :longitude).merge(organizer_id: current_user.id)
    end
  end
