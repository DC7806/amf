class Inquiry < ApplicationRecord
  validates :prefix, :first_name, :last_name, :number, :email, :message, presence: true
  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
end
