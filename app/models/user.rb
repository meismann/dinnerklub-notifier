class User < ActiveRecord::Base
  devise :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.first_name = auth.info.first_name
      user.last_name  = auth.info.last_name
      user.fb_path    = auth.info.urls.Facebook.sub(/^.+\/\/.+\/(.+$)/, '\1')
    end
  end
end
