class AddClassToCharacter < ActiveRecord::Migration
  def self.up
    add_column :characters, :character_class, :string
  end

  def self.down
    remove_column :characters, :character_class
  end
end
