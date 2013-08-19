class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.text :blurb
      t.integer :product_type_id

      t.timestamps
    end
  end
end
