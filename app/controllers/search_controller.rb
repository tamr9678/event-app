class SearchController < ApplicationController
  def index
    if params[:search]
      @events =  Event.where(['title LIKE ?', "%#{params[:search]}%"])
      @past_event = ActiveRecord::Type::Boolean.new.cast(params[:past_event])
      if !ActiveRecord::Type::Boolean.new.cast(params[:past_event])
        @events.where!('event_start_at > ?', Time.current)
      end
    else
      @events = Event.all
    end
  end
end
