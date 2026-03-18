class Ticket < ApplicationRecord
  belongs_to :user, optional: true
  has_many :support_emails, dependent: :nullify

  validates :subject, presence: true
  validates :status, presence: true
end
