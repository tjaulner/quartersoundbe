class Playlist < ApplicationRecord
  belongs_to :user
  has_many :tracks

  accepts_nested_attributes_for :tracks

  validates :playlist_name, presence: true
end
