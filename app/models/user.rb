class User < ApplicationRecord
    has_secure_password

    has_many :cocktails
    has_many :recipes, through: :cocktails

    validates :email, :first_name, presence: true
    validates :email, uniqueness: true
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
end