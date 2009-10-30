class CreateTools < ActiveRecord::Migration
  def self.up
    create_table :tools do |t|
      t.string :name
      t.string :vendor
      t.string :license_key
      t.string :license_server
      t.string :s3_snapshot

      t.timestamps
    end
  end

  def self.down
    drop_table :tools
  end
end
