class InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :number, :company_id
  belongs_to :company
end
