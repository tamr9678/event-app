class FavoritesController < ApplicationController
  def create
  Favorite.create(user_id: current_user.id, event_id: params[:event_id])
  redirect_to event_path(params[:event_id])
  end
end
