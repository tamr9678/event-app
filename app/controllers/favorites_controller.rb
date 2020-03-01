class FavoritesController < ApplicationController
  def create
  Favorite.create(user_id: current_user.id, event_id: params[:event_id])
  redirect_to event_path(params[:event_id])
  end

  def show
    favorites = Favorite.where(user_id: current_user.id)
    @events = favorites.map{|favorite| favorite.event}
  end

  def destroy
    Favorite.find_by(user_id: current_user.id, event_id: params[:event_id]).destroy
    redirect_to event_path(params[:event_id])
  end
end
