class AddClientToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :client_id, :integer
  end
end
