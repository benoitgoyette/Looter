class Loot < ActiveRecord::Base
  acts_as_taggable
  belongs_to :campaign
end
