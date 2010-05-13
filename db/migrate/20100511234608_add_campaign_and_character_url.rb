class AddCampaignAndCharacterUrl < ActiveRecord::Migration
  def self.up
    add_column :characters, :original_hit_points, :string
    add_column :characters, :current_hit_points, :string
  end

  def self.down
    remove_column :characters, :original_hit_points
    remove_column :characters, :current_hit_points
  end
end
