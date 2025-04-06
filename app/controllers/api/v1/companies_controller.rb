class Api::V1::CompaniesController < ApplicationController
  def index
    @companies = Company.all
    render json: @companies
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      render json: @company, status: :created
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  def show
    @company = Company.includes(:checks, :invoices).find(params[:id])
    render json: @company
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      render json: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    head :no_content
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end
end
