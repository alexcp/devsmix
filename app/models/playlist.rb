class Playlist < ActiveRecord::Base
  belongs_to :user
  validates :user_id, :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: {minimum: 3}
end
