class ParticipantsController < ApplicationController
  def create
    Participant.create(user_id: cuurent_user.id, event_id: params[:id])
    redirect_to events_path(params[:id])
  end
end
