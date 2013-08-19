class CompaniesController < ApplicationController
  def create
    Company.create(company_params)
  end

  def index
    @companies = Company.all

    render json: @companies
  end

  def show
    @company = Company.find(params[:id])

    render json: @company
  end

  private

  def company_params
    params.require(:company).permit(:name, :url)
  end
end
