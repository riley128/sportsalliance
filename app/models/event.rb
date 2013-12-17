class Event < ActiveRecord::Base
	attr_accessible :event_name,:header,:sub_header,:banner, :banner600x2000, :bannersquare,:price,:venue,:address,:description,:date,:start_time, :end_time

	has_attached_file :banner, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	has_attached_file :banner600x2000, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	has_attached_file :bannersquare, :styles => { :medium => "300x300>", :thumb => "100x100>" }


end
