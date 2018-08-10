class AddStripeIdToSubscribers < ActiveRecord::Migration[5.2]
  def change
    add_column :subscribers, :stripe_id, :integer
  end
end
