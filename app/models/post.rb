class Post < ApplicationRecord
    belongs_to :user
    validates :body, presence: true
    has_many :comments
    has_many :likes, dependent: :destroy
end
