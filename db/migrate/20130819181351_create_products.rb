class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :product_type_id
      t.integer :company_id
      t.string :url

      t.timestamps
    end
  end
end
