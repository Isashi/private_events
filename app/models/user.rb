class User < ApplicationRecord
	has_many :events, :foreign_key => :creator_id

  def feed
    Event.where("creator_id = ?", id)
  end
end
