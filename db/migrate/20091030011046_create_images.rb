class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.string :name
      t.string :ami
      t.boolean :x11
      t.string :os

      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end
