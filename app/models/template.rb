class Template < ActiveRecord::Base
  validates :blurb, presence: true
  validates :product_type_id, presence: true

  belongs_to :product_type
end
