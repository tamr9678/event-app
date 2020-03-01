class ParticipantsController < ApplicationController
  def create
    Participant.create(user_id: current_user.id, event_id: params[:event_id])
    redirect_to event_path(params[:event_id])
  end
end
