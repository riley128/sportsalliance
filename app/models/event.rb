class Event < ActiveRecord::Base
	has_many :event_users
    has_many :users, :through => :event_users

	attr_accessible :event_name,:header,:sub_header,:banner, :banner600x2000, :bannersquare,:price,:venue,:address,:description,:date,:start_time, :end_time
	attr_accessor :stripe_card_token

	has_attached_file :banner, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	has_attached_file :banner600x2000, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	has_attached_file :bannersquare, :styles => { :medium => "300x300>", :thumb => "100x100>" }


	def add_guest(user)
		add_user_with_role(user, :guest)
    end

    def guests
        users_with_roles(:guest)
    end


	private
    def get_event_user_for_user(user)
        event_users.select {|ev| ev.user == user}[0]
    end

    def add_user_with_role(user, role)
    	 event_user = get_event_user_for_user(user)
        if event_user.nil?
            event_user = EventUser.new
            event_user.event = self
            event_user.user = user
        end
        	event_user.send("is_#{role}=", true)
       		event_user.save
    end


    def users_with_role(role)
        event_user.select { |ev| ev.send("is_#{role}?") }
    end



end
