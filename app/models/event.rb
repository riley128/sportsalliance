class Event < ActiveRecord::Base
	attr_accessible :event_name,:header,:sub_header,:banner,:price,:venue,:address,:description,:start_time, :end_time

	has_attached_file :banner, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
