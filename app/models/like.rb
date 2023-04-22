class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true
  belongs_to :comment, optional: true
  belongs_to :playlist, optional: true
  belongs_to :track, optional: true
end
