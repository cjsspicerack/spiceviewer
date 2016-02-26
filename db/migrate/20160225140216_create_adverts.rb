class CreateAdverts < ActiveRecord::Migration
  def change
    create_table :adverts do |t|
      t.string :format
      t.text :files
      t.integer :campaign_id

      t.timestamps null: false
    end
  end
end
