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

end
