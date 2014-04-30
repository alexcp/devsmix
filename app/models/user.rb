class User < ActiveRecord::Base
  validates :uid, :name, :nickname, :email, :avatar, :location, :links, presence: true

  def self.from_omniauth auth
    find_by_uid(auth["id"]) || create_from_omniauth(auth)
  end

  def self.create_from_omniauth auth
    create! do |user|
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.nickname = auth["info"]["nickname"]
      user.email = auth["info"]["email"]
      user.avatar = auth["info"]["image"]
      user.links = auth["info"]["urls"].to_json
      user.location = auth["extra"]["raw_info"]["location"]
    end
  end
end
