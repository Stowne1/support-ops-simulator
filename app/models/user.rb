class User < ApplicationRecord
    has_many :tickets, dependent: :destroy
    has_many :support_emails, dependent: :nullify

    validates :email, presence: true
end
