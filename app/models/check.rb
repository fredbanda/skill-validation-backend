class Check < ApplicationRecord
  belongs_to :company
  # validates :created_at, presence: true
  validates :number, presence: true, length: { minimum: 5, maximum: 10 }

  has_many :check_invoices
  has_many :invoices, through: :check_invoices

  has_one_attached :image

  # Using ActiveStorage::Validator for validation
  validates :image, attached: true, content_type: [ "image/png", "image/jpeg" ]
end
