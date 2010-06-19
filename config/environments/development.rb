Looter::Application.configure do
  # Settings specified here will take precedence over those in config/environment.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_view.debug_rjs             = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  config.cookie_secret = 'ea6db5e9c6cd6964d9909cfb6c9101d958ae294b42c23c016739efd27da25e83789642b6a3111c0a2cddc7c1c8ba18d2811b195abceb6ea1e39edbda896a434c'
    
end
