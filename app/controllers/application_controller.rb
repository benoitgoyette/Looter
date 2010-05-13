class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  
  def assure_loggon
    return redirect_to new_user_session_path unless user_signed_in?
  end
  
  def get_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end
  def get_character
    @character = Character.find_by_id(params[:character_id])
    return render :text=>"Unauthorized access", :status=>403 if @character.blank?
  end
  
  def render_error(status)
    return render :file=>"#{Rail.root}/public/403.html"
  end
  
  def get_tags_count_on(model)
    query = <<-SQL
      SELECT tags.*, COUNT(*) AS count 
      FROM tags
      LEFT OUTER JOIN taggings ON tags.id = taggings.tag_id AND taggings.context = 'tags' 
      INNER JOIN notes ON notes.id = taggings.taggable_id 
      WHERE  (taggings.taggable_type = '#{model.to_s}') AND (taggings.taggable_id IN(SELECT notes.id FROM #{model.table_name})) 
      GROUP BY  tags.id, tags.name 
      HAVING COUNT(*) > 0
    SQL
    ActsAsTaggableOn::Tag.find_by_sql(query)
  end

end
