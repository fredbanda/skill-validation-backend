class CheckSerializer < ActiveModel::Serializer
  attributes :id, :number, :created_at, :company_name, :image_url
  has_many :invoices

  # Avoid recursion: only return the company name
  def company_name
    object.company&.name
  end

  def image_url
    Rails.application.routes.url_helpers.rails_blob_url(object.image) if object.image.attached?
  end
end
