class Api::V1::CheckInvoicesController < ApplicationController
  def index
  @check_invoices = CheckInvoice.all
  render json: @check_invoices
  end

def create
  @check_invoice = CheckInvoice.new(check_invoice_params)
  if @check_invoice.save
    render json: @check_invoice, status: :created
  else
    render json: @check_invoice.errors, status: :unprocessable_entity
  end
end

def destroy
  @check_invoice = CheckInvoice.find_by(check_id: params[:check_id], invoice_id: params[:invoice_id])
  if @check_invoice
    @check_invoice.destroy
    head :no_content
  else
    render json: { error: "CheckInvoice not found" }, status: :not_found
  end
end

private

def check_invoice_params
  params.require(:check_invoice).permit(:check_id, :invoice_id)
end
end
