class Playlist < ActiveRecord::Base
  belongs_to :user
  has_many :songs

  validates :user_id, :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: {minimum: 3}

  accepts_nested_attributes_for :songs, allow_destroy: true

  alias_method :author, :user
end
