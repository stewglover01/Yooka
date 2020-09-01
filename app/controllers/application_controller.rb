class ApplicationController < ActionController::Base
  before_action :set_banner
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_banner
    @show_banner = "orange" unless devise_controller?
  end

  def green_banner
    @show_banner = 'green'
  end

  def cream_banner
    @show_banner = 'cream'
  end

  def blue_banner
    @show_banner = "blue"
  end

  def curved_blue_banner
    @show_banner = "curved-blue"
  end

  def no_banner
    @show_banner = false
  end

    def configure_permitted_parameters
      # For additional fields in app/views/devise/registrations/new.html.erb
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :photo])

      # For additional in app/views/devise/registrations/edit.html.erb
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name, :photo])
    end
end
