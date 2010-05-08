class CreateStats < ActiveRecord::Migration
  def self.up
    create_table :stats do |t|
      t.string :name
      t.string :value
      t.string :original_value
      t.string :permanent_bonus
      t.string :temporary_bonus
      t.string :description
      t.string :category, :default=>'none'
      t.integer :character_id
      t.timestamps
    end
  end

  def self.down
    drop_table :stats
  end
end
