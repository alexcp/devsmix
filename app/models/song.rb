class Song < ActiveRecord::Base
  belongs_to :playlist
  validates :title, :url, presence: true
end
