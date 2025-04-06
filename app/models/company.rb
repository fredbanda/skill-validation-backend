class Company < ApplicationRecord
  validates :name, presence: true
  has_many :checks
  has_many :invoices
end
