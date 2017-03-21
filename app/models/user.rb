class User < ApplicationRecord

  def self.from_github(data, token)
    user = User.find_or_create_by(uid: data["id"])
    user.username = data["login"]
    user.token = token
    user.save
    return user
  end
end
