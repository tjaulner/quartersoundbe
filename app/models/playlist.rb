class Playlist < ApplicationRecord
  belongs_to :user
  has_many :tracks

  has_many :likes, dependent: :destroy

  accepts_nested_attributes_for :tracks

  has_one_attached :playlist_image

  validates :playlist_name, presence: true
end
