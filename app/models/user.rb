class User < ActiveRecord::Base
  def self.from_omniauth auth
    find_by_uid(auth["id"]) || create_from_omniauth(auth)
  end

  def self.create_from_omniauth auth
    create! do |user|
      user.uid = auth["id"]
      user.name = auth["name"]
    end
  end
end
