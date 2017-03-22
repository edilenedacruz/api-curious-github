class User < ApplicationRecord

  def self.from_github(data, access_token)
    user = User.find_or_create_by(uid: data["id"])
    user.username = data["login"]
    user.avatar = data["avatar_url"]
    user.token = access_token
    user.save

    return user
  end
end
