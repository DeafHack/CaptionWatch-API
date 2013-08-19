class ComplaintsController < ApplicationController
  def create
    c = Complaint.new(complaint_params)
    c.save!
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
    @complaint = Complaint.find(params[:id])

    render json: @complaint
  end

  private

  def complaint_params
    params.require(:complaint).permit(:address, :product_id, :zipcode, :custom_blurb, :url)
  end
end
