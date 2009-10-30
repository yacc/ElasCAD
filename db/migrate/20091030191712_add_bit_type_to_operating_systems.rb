class AddBitTypeToOperatingSystems < ActiveRecord::Migration
  def self.up
    add_column :operating_systems, :bit_type, :string
  end

  def self.down
    remove_column :operating_systems, :bit_type
  end
end
