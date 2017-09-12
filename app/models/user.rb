class User < ApplicationRecord
	has_many :events, :foreign_key => :creator_id

	has_many :invites, :foreign_key => :attendee_id
	has_many :attended_events, :through => :invites
	
  def feed
    Event.where("creator_id = ?", id)
  end
end
