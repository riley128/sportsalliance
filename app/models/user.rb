class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :event_users
  has_many :events, :through => :event_users

  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :hometown, :password, :password_confirmation, :remember_me

	 def self.from_omniauth(auth)
	  where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
	    user.provider = auth.provider
	    user.uid = auth.uid
	    user.email = auth.info.email
	    user.token = auth.credentials.token
	    user.expires_at = Time.at(auth.credentials.expires_at)
	    user.nickname = auth.info.nickname
	    user.name = auth.info.name
	    user.first_name = auth.info.first_name
	    user.last_name = auth.info.last_name
	    user.image = auth.info.image
	    user.urls = auth.info.urls.Facebook
	    user.location = auth.info.location
	    user.verified = auth.info.verified
	    user.expires = auth.credentials.expires
	    user.gender = auth.extra.raw_info.gender
	    user.timezone = auth.extra.raw_info.timezone
	    user.locale = auth.extra.raw_info.locale
	    user.hometown = auth.extra.raw_info.hometown.name	
	  end
	end

	def self.new_with_session(params,session)
		if session["devise.user_attributes"]
			new(session["devise.user_attributes"], without_protection: true) do |user|
				user.attributes = params
				user.valid?
			end
		else
			super
		end
	end

	def password_required?
  		super && provider.blank?
	end

	def update_with_password(params, *options)
	  if encrypted_password.blank?
	    update_attributes(params, *options)
	  else
	    super
	  end
	end

	def facebook
	  @facebook ||= Koala::Facebook::API.new(token)
	  block_given? ? yield(@facebook) : @facebook
	rescue Koala::Facebook::APIError => e
	  logger.info e.to_s
	  nil # or consider a custom null object
	end

def friends_count
  facebook { |fb| fb.get_connection("me", "friends").size }
end
end