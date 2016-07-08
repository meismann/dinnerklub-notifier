class User < ActiveRecord::Base
  devise :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
    user = find_or_create_by(provider: auth.provider, uid: auth.uid)
    user.update_if_necessary(auth)

    user
  end

  def update_if_necessary(auth)
    self.name  = auth.info.name
    self.fb_path    = auth.info.urls.Facebook.sub(/^.+\/\/.+\/(.+$)/, '\1')
    save if changed?
  end
end
