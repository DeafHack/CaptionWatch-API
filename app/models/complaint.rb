class Complaint < ActiveRecord::Base
  validates :address, presence: true
  validates :product_id, presence: true

  belongs_to :product

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def blurb
    return custom_blurb if custom_blurb.present?
    return product.product_type.template.blurb
  end
end
