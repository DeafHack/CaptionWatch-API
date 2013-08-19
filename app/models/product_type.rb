class ProductType < ActiveRecord::Base
  validates :label, presence: true

  has_one :template
end
