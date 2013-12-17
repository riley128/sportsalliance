class EventUser < ActiveRecord::Base
	attr_accessible :event_users,  :event_id, :uid, :event_name, :email, :first_name, :last_name, :is_admin, :is_host, :is_guest
end
