class ApplicationController < ActionController::Base
  before_action :set_request_variant
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def set_request_variant
    case request.user_agent
    when /iPad/
      request.variant = :phone
    when /iPhone/
      request.variant = :phone
    when /Android/
      request.variant = :phone
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:parent_name, :child_name, :school_name, :school_admin, :school_id, :room_id, :admin])
  end

  def after_sign_in_path_for(resource)
      case resource
      when User
        rooms_path
      when School
        schools_path
      end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :school
      new_school_session_path
    else
      new_user_session_path
    end
  end
  
end