class Event < ActiveRecord::Base
	has_many :events_users
    has_many :users, :through => :events_users
    validate :ensure_has_admin
    validates :event_name, presence: true

    attr_accessible :event_name

    #guest functions
    def add_guest(user)
        add_user_with_role(user, :guest)
    end

    def remove_guest(user)
        remove_user_with_role(user, :guest)
    end

    def guests
        users_with_roles(:guest)
    end

    #host functions
    def add_host(user)
        add_user_with_role(user, :host)
    end

    def remove_host(user)
        remove_user_with_role(user, :host)
    end

    def hosts
        users_with_roles(:host)
    end

    #admin functions
    def add_admin(user)
        add_user_with_role(user, :admin)
    end

    def remove_admin(user)
        remove_user_with_role(user, :admin)
    end

    def admins
        users_with_roles(:admin)
    end

    #additional actions
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

    def remove_user_with_role(user, role)
        event_user = get_event_user_for_user(user)
        return if event_user.nil?
        event_user.send("is_#{role}=", false)
        if !event_user.is_admin? && !event_user.is_host && !event_user.is_guest
            event_user.destroy
        else
            event_user.save
        end
    end

    def users_with_role(role)
        event_users.select { |ev| ev.send("is_#{role}?") }
    end

    def ensure_has_admin
        if admins.empty?
            errors.add(:admins, "must have at least one admin")
        end
    end
end

