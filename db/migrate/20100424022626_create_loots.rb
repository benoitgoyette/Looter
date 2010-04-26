class CreateLoots < ActiveRecord::Migration
  def self.up
    create_table :loots do |t|
      t.string :location
      t.text :loot
      t.integer :campaign_id
      t.timestamps
    end
  end

  def self.down
    drop_table :loots
  end
end
