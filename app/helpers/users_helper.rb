module UsersHelper
  def avatar user, size=:small
    sizes = {tiny: 20, small: 100, medium: 220, large: 300}
    image_tag user.avatar + "s=#{sizes[size]}"
  end

  def user_playlists
    if @playlists.any?
      render "users/playlists"
    else
      "This user doesn't have any playlist"
    end
  end
end
