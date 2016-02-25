class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.text :logo
      t.string :name
      t.text :emails

      t.timestamps null: false
    end
  end
end
