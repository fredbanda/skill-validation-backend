class Api::V1::ChecksController < ApplicationController
  def index
    @checks = Check.includes(:invoices).all
    render json: @checks
  end

  def show
    @check = Check.find(params[:id])
    render json: @check
  end

  def create
    @check = Check.new(check_params.except(:image))
    @check.image.attach(check_params[:image]) if check_params[:image].present?

    if @check.save
      render json: {
        id: @check.id,
        number: @check.number,
        image_url: @check.image.attached? ? url_for(@check.image) : nil
      }, status: :created, content_type: "application/json"
    else
      render json: { errors: @check.errors.full_messages }, status: :unprocessable_entity
    end
  end



  def update
    @check = Check.find(params[:id])
    if @check.update(check_params)
      render json: @check
    else
      render json: @check.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @check = Check.find(params[:id])
    @check.destroy
    head :no_content
  end

  def link_invoices
    @check = Check.find(params[:id])

    # Assuming you pass invoice_ids in the request params
    if params[:invoice_ids].present?
      # This will create the associations between check and invoices
      @check.invoice_ids = params[:invoice_ids]

      if @check.save
        render json: @check, status: :ok
      else
        render json: @check.errors, status: :unprocessable_entity
      end
    else
      render json: { error: "No invoice_ids provided" }, status: :bad_request
    end
  end

  private

  def check_params
    params.require(:check).permit(:created_at, :number, :company_id, :image)
  end
end
