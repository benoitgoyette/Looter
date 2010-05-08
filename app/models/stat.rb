class Stat < ActiveRecord::Base
  belongs_to :character

  class << self
    def create_quick_stat(character, quick_stat)
      begin 
        stats = []
        stats_arr = quick_stat.gsub(/,/, "\n").split("\n")
        stats = stats_arr.map do |stat| 
          fields = stat.split(':') 
          {:name=>fields[0].strip, :value=>fields[1].strip, :category=>fields[2].strip, :character_id=>character.id}
        end
        create stats
      rescue Exception => e
        raise Exception.new("invalid quick_stats format")
      end
    end
  end
end
