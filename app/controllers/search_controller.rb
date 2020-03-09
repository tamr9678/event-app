class SearchController < ApplicationController
  def index
    if params[:search]
      @events =  Event.where(['title LIKE ? OR discription LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%"]).page(params[:page]).per(5)
      @past_event = ActiveRecord::Type::Boolean.new.cast(params[:past_event])
      @capacity_over = ActiveRecord::Type::Boolean.new.cast(params[:capacity_over])
      if !ActiveRecord::Type::Boolean.new.cast(params[:past_event])
        @events.where!('event_start_at > ?', Time.current)
      end
      if ActiveRecord::Type::Boolean.new.cast(params[:capacity_over])
        @events = @events.select{|event| event.participants.count < event.capacity}
      end
    else
      @events = Event.page(params[:page]).per(5)
    end
  end
end
