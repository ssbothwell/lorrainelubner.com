class AddDateToPainting < ActiveRecord::Migration
  def self.up
    add_column :paintings, :year, :integer
  end

  def self.down
    remove_column :paintings, :year
  end
end
