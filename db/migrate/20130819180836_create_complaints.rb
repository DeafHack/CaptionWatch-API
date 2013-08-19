class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.text :custom_blurb
      t.string :url
      t.integer :product_id
      t.string :address
      t.integer :zipcode

      t.timestamps
    end
  end
end
