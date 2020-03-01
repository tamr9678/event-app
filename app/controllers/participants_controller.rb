class ParticipantsController < ApplicationController
  def create
    Participant.create(user_id: current_user.id, event_id: params[:event_id])
    redirect_to event_path(params[:event_id])
  end

  def show
    participants = Participant.where(user_id: current_user.id)
    @events = participants.map{|participant| participant.event}
  end

  def destroy
    Participant.find_by(user_id: current_user.id, event_id: params[:event_id]).destroy
    redirect_to event_path(params[:event_id])
  end

  
end
