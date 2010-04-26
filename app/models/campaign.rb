class Campaign < ActiveRecord::Base
  has_many :notes
  has_many :loots
end
