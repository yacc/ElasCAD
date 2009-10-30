class CreateEsbs < ActiveRecord::Migration
  def self.up
    create_table :esbs do |t|
      t.string :name
      t.integer :size
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :esbs
  end
end
