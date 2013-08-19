class TemplatesController < ApplicationController
  def create
    Template.create(template_params)
  end

  def index
    @templates = Template.all

    render json: @templates
  end

  def show
    @template = Template.find(params[:id])

    render json: @template
  end

  private

  def template_params
    params.require(:template).permit(:blurb)
  end
end
