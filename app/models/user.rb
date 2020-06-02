class User < ApplicationRecord
    validates :username, presence: true, length: {minimum: 3, maximum: 100 }, uniqueness: { case_sensitive: false}
    has_secure_password
    has_many :mmessages
end
