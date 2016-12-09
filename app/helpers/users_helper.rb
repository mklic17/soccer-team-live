module UsersHelper

  def gravatar_for(user, size: 80)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#gravatar_id)?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def checkUser
    if User.count == 0
        User.create(name: "admin", email: "admin@admin.com", password: "administrator", password_confirmation: "administrator", admin: true, admin: true, position: "admin", hometown: "adminr", number: 0, team_id: 1)
      end
  end

end
