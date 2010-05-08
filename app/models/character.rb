class Character < ActiveRecord::Base
  belongs_to :user
  belongs_to :campaign
  has_many :stats, :order=>:name
  
  def stats_by_categories
    categories = {}
    self.stats.each do |stat|
      categories[stat.category] ||= []
      categories[stat.category] << stat
    end
    categories
  end
  
  
  class << self
    def user_campaign(user, campaign)
      Character.find_by_campaign_id_and_user_id(campaign.id, user.id)    
    end
  end
  
end
