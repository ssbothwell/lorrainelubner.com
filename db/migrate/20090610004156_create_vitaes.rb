class CreateVitaes < ActiveRecord::Migration
  def self.up
    create_table :vitaes do |t|
      t.string :entry
      t.references :cvcat
      t.timestamps
    end
  end
  
  def self.down
    drop_table :vitaes
  end
end
