class InvitesController < ApplicationController
	def create
		@event = Event.find(params[:invite][:attended_event_id])
		current_user.invites.find_or_create_by(attended_event_id: @event.id)
		redirect_to @event
	end
end
