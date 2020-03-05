class FavoritesController < ApplicationController
  def create
  Favorite.create(user_id: current_user.id, event_id: params[:event_id])
  redirect_to event_path(params[:event_id])
  end

  def show
    @events =Event.includes(:participants).where(participants: {user_id: current_user.id}).order(created_at: :desc)
  end

  def destroy
    Favorite.find_by(user_id: current_user.id, event_id: params[:event_id]).destroy
    redirect_to event_path(params[:event_id])
  end
end
