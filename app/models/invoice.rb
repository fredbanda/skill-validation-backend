class Invoice < ApplicationRecord
  belongs_to :company
  validates :number, presence: true, length: { minimum: 5, maximum: 10 }
  has_many :checks, through: :check_invoices
end
