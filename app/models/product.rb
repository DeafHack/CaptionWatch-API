class Product < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :product_type
  belongs_to :company
  has_many :complaints

  def template
    return self.product_type.template
  end
end
