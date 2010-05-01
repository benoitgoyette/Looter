class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  
  def assure_loggon
    return redirect_to new_user_session_path unless user_signed_in?
  end
  
  def get_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end
  
end
