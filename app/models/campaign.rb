class Campaign < ActiveRecord::Base
  has_many :notes, :dependent => :destroy
  has_many :loots, :dependent => :destroy
  has_many :characters, :dependent => :destroy
end
