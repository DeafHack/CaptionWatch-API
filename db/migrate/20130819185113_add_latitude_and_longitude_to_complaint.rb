class AddLatitudeAndLongitudeToComplaint < ActiveRecord::Migration
  def change
    add_column :complaints, :latitude, :float
    add_column :complaints, :longitude, :float
  end
end
