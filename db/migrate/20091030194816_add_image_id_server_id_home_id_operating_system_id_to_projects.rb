class AddImageIdServerIdHomeIdOperatingSystemIdToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :image_id, :integer
    add_column :projects, :server_id, :integer
    add_column :projects, :home_id, :integer
    add_column :projects, :operating_system_id, :integer ,:null => false
  end

  def self.down
    remove_column :projects, :operating_system_id
    remove_column :projects, :home_id
    remove_column :projects, :server_id
    remove_column :projects, :image_id
  end
end
