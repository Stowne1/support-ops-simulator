class SupportEmail < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :ticket, optional: true

  validates :from_email, presence: true
  validates :subject, presence: true
end
