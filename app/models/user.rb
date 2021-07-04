class User < ApplicationRecord
    has_secure_password

    has_many :cocktails
    has_many :recipes, through: :cocktails
    has_many :comments

    validates :email, presence: true
    validates :email, uniqueness: true
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

    def self.create_from_omniauth(auth)
        User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
        u.email = auth['info']['email']
        u.password = SecureRandom.hex(16)
        end
    end

end