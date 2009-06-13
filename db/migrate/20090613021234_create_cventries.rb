class CreateCventries < ActiveRecord::Migration
  def self.up
    create_table :cventries do |t|
      t.string :entry
      t.references :cvcat

      t.timestamps
    end
  end

  def self.down
    drop_table :cventries
  end
end
