class Playlist < ApplicationRecord
  belongs_to :user
  has_many :tracks

  validates :playlist_name, presence: true
end
