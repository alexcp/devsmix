class Song < ActiveRecord::Base
  belongs_to :playlist
  validates :title, :url, :playlist_id, presence: true

  def youtube_id
    url.split(/v=/).last
  end
end
