class AddEmailToComplaints < ActiveRecord::Migration
  def change
    add_column :complaints, :email, :string
  end
end
