class Track < ApplicationRecord
  belongs_to :user
  belongs_to :playlist

  has_many :likes, dependent: :destroy
end
