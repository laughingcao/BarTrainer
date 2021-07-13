class Comment < ApplicationRecord
    belongs_to :cocktail
    belongs_to :user

    validates :comment_text, presence: true

    scope :users_comment, -> { where("user_id: == @user.id")}
end