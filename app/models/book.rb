class Book < ApplicationRecord
    belongs_to :user
    has_many :favorites, dependent: :destroy
    has_many :book_comments, dependent: :destroy
    
    validates :title, presence: true, length: { maximum: 20 }
    validates :body, presence: true, length: { maximum: 50 }
    def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
    end
end
