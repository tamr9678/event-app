class SearchController < ApplicationController
  def index
    if params[:search]
      @events =  Event.where(['title LIKE ?', "%#{params[:search]}%"])
    else
      @events = Event.all
    end
  end
end
