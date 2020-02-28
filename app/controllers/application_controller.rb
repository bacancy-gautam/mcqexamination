# frozen_string_literal: true

# vatsal
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    if current_user.has_role?(:faculty)
      faculties_path
    elsif current_user.has_role?(:admin)
      admin_index_path
    elsif current_user.has_role?(:student)
      students_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |u|
      u.permit(:login, :enrollment, :email, :remember_me, :password)
    end
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:enrollment, :sem, :fname, :lname, :email, :branch, :password,
               :mobile, :pyear, :status)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:enrollment, :sem, :fname, :lname, :email, :branch, :password,
               :mobile, :pyear, :password_confirmation, :current_password,
               :status)
    end
  end
end
