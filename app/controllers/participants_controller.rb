class ParticipantsController < ApplicationController
  def create
    Participant.create(user_id: current_user.id, event_id: params[:event_id])
    redirect_to event_path(params[:event_id])
  end

  def show
    @events =Event.includes(:participants).where(participants: {user_id: current_user.id}).order(created_at: :desc)
    @events.where!('event_start_at > ?', Time.current)
  end

  def history
  end

  def destroy
    Participant.find_by(user_id: current_user.id, event_id: params[:event_id]).destroy
    redirect_to event_path(params[:event_id])
  end
end
