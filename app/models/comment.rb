class Comment < ApplicationRecord
    validates :body, presence: true
    belongs_to :user
    belongs_to :post, optional: true ##changed to optional in order to test
    belongs_to :playlist, optional: true

    has_many :likes, dependent: :destroy
end
