class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :comment

  has_many :likes, dependent: :destroy
end
