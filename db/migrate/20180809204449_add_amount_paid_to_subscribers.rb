class AddAmountPaidToSubscribers < ActiveRecord::Migration[5.2]
  def change
    add_column :subscribers, :amount_paid, :integer
  end
end
