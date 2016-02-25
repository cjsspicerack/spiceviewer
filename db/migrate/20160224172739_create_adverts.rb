class CreateAdverts < ActiveRecord::Migration
  def change
    create_table :adverts do |t|
      t.integer :dimensions
      t.integer :campaign_id

      t.timestamps null: false
    end
  end
end
