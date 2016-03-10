class AddNameToAdvert < ActiveRecord::Migration
  def change
    add_column :adverts, :name, :string
  end
end
