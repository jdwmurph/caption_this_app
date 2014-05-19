class AddPublishedColumnToImages < ActiveRecord::Migration
  def change
    add_column :images, :published, :boolean, default:false
  end
end
