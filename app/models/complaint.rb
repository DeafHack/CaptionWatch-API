class Complaint < ActiveRecord::Base
  validates :address, presence: true
  validates :product_id, presence: true

  belongs_to :product

  def blurb
    return custom_blurb if custom_blurb.present?
    return product.product_type.template.blurb
  end
end
