class CreateS3Snapshots < ActiveRecord::Migration
  def self.up
    create_table :s3_snapshots do |t|
      t.string :name
      t.string :snapshot_status

      t.timestamps
    end
  end

  def self.down
    drop_table :s3_snapshots
  end
end
