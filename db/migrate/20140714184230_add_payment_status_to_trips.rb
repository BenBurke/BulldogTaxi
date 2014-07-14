class AddPaymentStatusToTrips < ActiveRecord::Migration
  def change
  	add_column :trips, :payment_status, :boolean, default: false
  end
end
