class Comment < ApplicationRecord
    validates :body, presence: true
    belongs_to :user
    belongs_to :post, optional: true 
    
    belongs_to :playlist, optional: true

    has_many :likes, dependent: :destroy
    has_many :replies, dependent: :destroy

    validates :body, presence: :true
end
