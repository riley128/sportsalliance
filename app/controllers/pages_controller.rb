class PagesController < ApplicationController
  def home
  	@events = Event.all
  end

  def myaccount
  end

  def myevents
  end
end
