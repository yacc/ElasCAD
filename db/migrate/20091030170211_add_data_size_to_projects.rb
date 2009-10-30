class AddDataSizeToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :data_size, :integer
  end

  def self.down
    remove_column :projects, :data_size
  end
end
