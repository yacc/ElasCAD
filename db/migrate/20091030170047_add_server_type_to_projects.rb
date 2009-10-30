class AddServerTypeToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :server_type, :string
  end

  def self.down
    remove_column :projects, :server_type
  end
end
