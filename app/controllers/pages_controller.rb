class PagesController < ApplicationController
  def home
  	@events = Event.all
  end

  def myaccount
  end

  def myevents
  	@event_users = EventUser.where user_id: current_user.id if current_user
  	@events = Event.all
  end
end
