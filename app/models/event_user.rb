class EventUser < ActiveRecord::Base
	self.table_name = "events_users"
	belongs_to :user
	belongs_to :event

    attr_accessible :event_id, :user_id, :is_admin, :is_host, :is_guest
end
