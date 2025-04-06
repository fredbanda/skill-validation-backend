class Api::V1::InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all
    render json: @invoices
  end

  def show
    @invoice = Invoice.includes(:checks).find(params[:id])
    render json: @invoice, include: [ :checks ], only: [ :id, :number ]
  end

  def create
    @invoice = Invoice.new(invoice_params)
    if @invoice.save
      render json: @invoice, status: :created
    else
      render json: @invoice.errors, status: :unprocessable_entity
    end
  end

  def update
    @invoice = Invoice.find(params[:id])
    if @invoice.update(invoice_params)
      render json: @invoice
    else
      render json: @invoice.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy
  end

  private

  def invoice_params
    params.require(:invoice).permit(:number, :company_id)
  end
end
