class RemoveFilesFromAdverts < ActiveRecord::Migration
  def change
    remove_column :adverts, :files, :text
    add_column :adverts, :files, :json
  end
end
