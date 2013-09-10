class ComplaintsController < ApplicationController
  def create
    c = Complaint.create(complaint_params)
    options = Hashie::Mash.new
    options.methods = [:blurb]

    render json: c.to_json(options)
  end

  def index
    if params[:search].present?
      @complaints = Complaint.near(params[:search], 50, order: :distance)
    else
      @complaints = Complaint.all
    end

    render json: @complaints
  end

  def show
    complaint = Complaint.find(params[:id])
    options = Hashie::Mash.new
    options.methods = [:blurb]
    options.except = [:custom_blurb]
    options.include = {product: { include: {company: {}}}}

    render json: complaint.to_json(options)
  end

  private

  def complaint_params
    params.require(:complaint).permit(:address, :product_id, :zipcode, :custom_blurb, :url)
  end
end
