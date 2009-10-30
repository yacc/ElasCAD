class CreateOperatingSystems < ActiveRecord::Migration
  def self.up
    create_table :operating_systems do |t|
      t.string :name
      t.string :version
      t.string :release
      t.string :provider

      t.timestamps
    end
  end

  def self.down
    drop_table :operating_systems
  end
end
