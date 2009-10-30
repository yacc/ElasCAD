class AddSizeToHomes < ActiveRecord::Migration
  def self.up
    add_column :homes, :size, :integer
  end

  def self.down
    remove_column :homes, :size
  end
end
